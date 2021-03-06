package mops.module.services;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import lombok.RequiredArgsConstructor;
import mops.module.database.Antrag;
import mops.module.database.Modul;
import mops.module.repositories.AntragRepository;
import mops.module.repositories.ModulSnapshotRepository;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AntragService {

    private final AntragRepository antragRepository;
    private final ModulSnapshotRepository modulSnapshotRepository;

    /**
     * Erstellt einen Änderungsantrag aus einem Modul heraus.
     *
     * @param modul Modul auf welches der Antrag angewendet wird
     * @return Änderungsantrag
     */
    Antrag modulToAntrag(Modul modul) {
        String jsonObject = JsonService.modulToJsonObject(modul);
        Antrag antrag = new Antrag();
        antrag.setJsonModulAenderung(jsonObject);
        antrag.setModulId(modul.getId());
        return antrag;
    }

    /**
     * Antrag für eine Moduländerung abschicken.
     * Falls das Modul nicht verändert wurde, oder ein nicht existierendes Modul übergeben wurde,
     * wird eine Exception geworfen.
     *
     * @param newModul Neues Modul mit korrekter ID!
     */
    public Antrag addModulModificationAntrag(Modul newModul, String antragsteller)
            throws IllegalArgumentException {
        Modul oldModul = modulSnapshotRepository.findById(newModul.getId()).orElse(null);
        if (oldModul == null) {
            throw new IllegalArgumentException("Fehlerhaftes Modul!");
        } else {
            Modul diffModul = ModulService.calculateModulDiffs(oldModul, newModul);

            if (diffModul == null) {
                throw new IllegalArgumentException("Das Modul wurde nicht verändert!");
            }

            diffModul.setDatumAenderung(LocalDateTime.now());
            Antrag antrag = modulToAntrag(diffModul);
            antrag.setDatumErstellung(LocalDateTime.now());
            antrag.setAntragsteller(antragsteller);
            antragRepository.save(antrag);
            return antrag;
        }
    }

    /**
     * Antrag für die Erstellung eines neuen Moduls abschicken.
     *
     * @param newModul Neues Modul
     */
    public Antrag addModulCreationAntrag(Modul newModul, String antragsteller) {
        newModul.setId(null);
        newModul.setDatumErstellung(LocalDateTime.now());
        newModul.setDatumAenderung(LocalDateTime.now());

        Antrag antrag = modulToAntrag(newModul);
        antrag.setDatumErstellung(LocalDateTime.now());
        antrag.setAntragsteller(antragsteller);
        antragRepository.save(antrag);
        return antrag;
    }

    /**
     * Genehmigt den Änderungsantrag.
     *
     * @param antrag Muss ein Modul beinhalten, das schon existiert
     */
    public Modul approveModulModificationAntrag(Antrag antrag) {
        Modul oldModul = modulSnapshotRepository.findById(antrag.getModulId()).orElse(null);
        if (oldModul == null) {
            throw new IllegalArgumentException(
                    "Modul konnte in der Datenbank nicht gefunden werden!");
        }
        ModulService.applyAntragOnModul(oldModul, antrag);
        oldModul.refreshMapping();
        Modul modul = modulSnapshotRepository.save(oldModul);

        antrag.setDatumGenehmigung(LocalDateTime.now());
        antragRepository.save(antrag);
        return modul;
    }

    /**
     * Fügt einen Antrag zur Erstellung eines neuen Moduls hinzu.
     * @param antrag Antrag mit neuem Modul, in dem die Modul id null ist
     */
    public Modul approveModulCreationAntrag(Antrag antrag) {
        Modul modulFromJson = JsonService.jsonObjectToModul(antrag.getJsonModulAenderung());
        modulFromJson.refreshMapping();
        modulFromJson.setSichtbar(true);

        modulFromJson.setSichtbar(true);
        Modul modul = modulSnapshotRepository.save(modulFromJson);

        antrag.setDatumGenehmigung(LocalDateTime.now());
        antrag.setModulId(modul.getId());
        antragRepository.save(antrag);
        return modul;
    }

    public List<Antrag> getAlleAntraege() {
        return StreamSupport.stream(antragRepository.findAll().spliterator(), false)
                .collect(Collectors.toList());
    }

    /**
     * Gibt alle Anträge geordnet nach Datum als Liste zurück, wobei der neueste Antrag
     * das erste Element ist.
     * @return Die sortierte Liste aller Anträge.
     */
    public List<Antrag> getAlleAntraegeGeordnetDatum() {
        return getAlleAntraege().stream()
                .sorted(Comparator.comparing(Antrag::getDatumErstellung).reversed())
                .collect(Collectors.toList());
    }

    public List<Antrag> getAlleOffenenAntraegeGeordnetDatum() {
        return getAlleAntraegeGeordnetDatum().stream().filter(x -> x.getDatumGenehmigung() == null)
                .collect(Collectors.toList());
    }

    public Antrag getAntragById(Long id) {
        return antragRepository.findById(id).orElse(null);
    }

    /**
     * Gibt alle Versionen für das Modul mit der angebenen id als Liste aus.
     * @param id Die id eines in der Datenbank existierenden (d.h. genehmigten) Moduls.
     * @return Eine Liste aller Versionen des Moduls, wobei der erste Listeneintrag das Modul
     *         im initialen Erstellungsantrag ist und der letzte Listeneintrag das Modul im
     *         aktuellen Status ist. Da Sichtbarkeitsstatus und Semester nicht über Anträge
     *         geändert werden, sind diese Informationen nicht enthalten.
     */
    public LinkedList<Modul> getAllVersionsOfModulOldestFirst(Long id) {
        List<Antrag> relevantApprovedAntraege = getAllApprovedAntraegeForModulOldestFirst(id);
        LinkedList<Modul> modulVersions = new LinkedList<>();
        for (int i = 1; i < relevantApprovedAntraege.size(); i++) {
            //initiale Version (Creation-Antrag)
            Modul versionI = JsonService.jsonObjectToModul(
                    relevantApprovedAntraege.get(0).getJsonModulAenderung());
            //für Schleifendurchgang i jeweils alle Modification-Antraege bis zum i-ten anwenden
            for (int j = 0; j < i; j++) {
                ModulService.applyAntragOnModul(versionI, relevantApprovedAntraege.get(j));
            }
            modulVersions.add(versionI);
        }
        //aktuelle Version
        Modul currentModul = modulSnapshotRepository.findById(id).orElse(null);
        modulVersions.add(currentModul);
        return modulVersions;
    }

    /**
     * Gibt alle genehmigten Anträge für das Modul mit der angebenen id als Liste aus.
     * @param id Die id eines in der Datenbank existierenden (d.h. genehmigten) Moduls.
     * @return Eine Liste aller genehmigten Anträge zum Modul, wobei der erste Listeneintrag
     *         der initiale Erstellungsantrag ist. Da Sichtbarkeitsstatus und Semester nicht
     *         über Anträge geändert werden, sind diese Informationen nicht enthalten.
     */
    public LinkedList<Antrag> getAllApprovedAntraegeForModulOldestFirst(Long id) {
        return getAllAntraegeForModul(id).stream()
                .filter(a -> a.getDatumGenehmigung() != null)
                .sorted(Comparator.comparing(Antrag::getDatumGenehmigung))
                .collect(Collectors.toCollection(LinkedList::new));
    }

    private List<Antrag> getAllAntraegeForModul(Long id) {
        if (!modulSnapshotRepository.findById(id).isPresent()) {
            throw new IllegalArgumentException(
                    "Versionierung nicht möglich, da Modul-Id nicht existiert");
        }
        List<Antrag> relevantAntraege = getAlleAntraege().stream()
                .filter(a -> a.getModulId() != null)
                .filter(a -> a.getModulId().equals(id))
                .collect(Collectors.toList());
        if (relevantAntraege.size() < 1) {
            throw new IllegalArgumentException(
                    "Initialer Antrag des Moduls in Versionierung nicht gefunden");
        }
        return relevantAntraege;
    }

    public void deleteAntrag(Long id) {
        antragRepository.deleteById(id);
    }

    /**
     * Gibt für die Liste von Modulen eine Liste von Unterlisten aus, wobei die Unterlisten
     * jeweils alle genehmigten Versionen des Moduls als Liste sind.
     * @param module Liste von existierenden (d.h. in Datenbank vorhandenen) Modulen
     * @return ArrayList von LinkedLists mit den entsprechenden Versionen
     */
    public ArrayList<LinkedList<Modul>> getAllVersionsListFor(List<Modul> module) {
        ArrayList<LinkedList<Modul>> allVersions = new ArrayList<>();
        for (Modul modul :  module) {
            if (modul.getId() != null) {
                allVersions.add(getAllVersionsOfModulOldestFirst(modul.getId()));
            }
        }
        return allVersions;
    }

    /**
     * Gibt für die Liste von Modulen eine Liste von Unterlisten aus, wobei die Unterlisten
     * jeweils alle genehmigten Antraege zu dem Modul als Liste sind.
     * @param module Liste von existierenden (d.h. in Datenbank vorhandenen) Modulen
     * @return ArrayList von LinkedLists mit den entsprechenden Anträgen
     */
    public ArrayList<LinkedList<Antrag>> getAllAntraegeListFor(List<Modul> module) {
        ArrayList<LinkedList<Antrag>> allAntraege = new ArrayList<>();
        for (Modul modul :  module) {
            if (modul.getId() != null) {
                allAntraege.add(getAllApprovedAntraegeForModulOldestFirst(modul.getId()));
            }
        }
        return allAntraege;
    }
}
