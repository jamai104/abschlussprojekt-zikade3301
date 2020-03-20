package mops.module.controllertests;

import static mops.module.controllertests.AuthenticationTokenGenerator.generateAuthenticationToken;
import static org.hamcrest.core.StringContains.containsString;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;

import mops.module.database.Antrag;
import mops.module.database.Modul;
import mops.module.services.AntragService;
import mops.module.services.JsonService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@SpringBootTest
@AutoConfigureMockMvc
class AdministratorControllerTest {

    @Autowired
    private WebApplicationContext context;
    private MockMvc mvc;

    @MockBean
    private AntragService antragService;

    @BeforeEach
    void setUp() {
        mvc = MockMvcBuilders.webAppContextSetup(context)
                .alwaysDo(print())
                .apply(springSecurity())
                .build();
    }

    private final String expect = "administrator";

    @Test
    void testAdministratorViewName() throws Exception {
        SecurityContextHolder
                .getContext()
                .setAuthentication(generateAuthenticationToken("sekretariat"));

        mvc.perform(get("/module/administrator"))
                .andExpect(view().name(expect));
    }

    @Test
    void testAdministratorStatusLoggedIn() throws Exception {
        SecurityContextHolder
                .getContext()
                .setAuthentication(generateAuthenticationToken("sekretariat"));

        mvc.perform(get("/module/administrator"))
                .andExpect(status().isOk());
    }

    @Test
    void testAdministratorNoAccessIfNotLoggedIn() throws Exception {
        assertThrows(java.lang.AssertionError.class,
                () -> {
                    mvc.perform(get("/module/administrator")).andExpect(view().name(expect));
                });
    }

    @Test
    void testAdministratorNoAccessForStudents() throws Exception {
        SecurityContextHolder
                .getContext()
                .setAuthentication(generateAuthenticationToken("studentin"));

        assertThrows(java.lang.AssertionError.class,
                () -> {
                    mvc.perform(get("/module/administrator")).andExpect(view().name(expect));
                });
    }

    @Test
    void testAdministratorNoAccessForOrganisator() throws Exception {
        SecurityContextHolder
                .getContext()
                .setAuthentication(generateAuthenticationToken("orga"));

        assertThrows(java.lang.AssertionError.class,
                () -> {
                    mvc.perform(get("/module/administrator")).andExpect(view().name(expect));
                });
    }

    //Fehlerhaft. Also klappt aktuell, aber nur weil ich nicht viel Abfrage in antragdetails.html

    @Test
    void testAntragdetailsViewName() throws Exception {
        SecurityContextHolder
                .getContext()
                .setAuthentication(generateAuthenticationToken("sekretariat"));

        final String expect = "antragdetails";
        Antrag neuerAntrag = new Antrag();
        neuerAntrag.setJsonModulAenderung("{'studiengang':'Informatik'}");

        when(antragService.getAntragById((long) 3301)).thenReturn(neuerAntrag);

        mvc.perform(get("/module/antragdetails/3301"))
                .andExpect(view().name(expect));
    }
}