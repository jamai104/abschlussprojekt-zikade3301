package mops.module.keycloak;

import org.keycloak.KeycloakPrincipal;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;

public class KeycloakMopsAccount {

    /**
     * KeycloakAccount.
     *
     * @param token the token of keycloak for permissions.
     * @return new Account for Keycloak
     */

    public static Account createAccountFromPrincipal(KeycloakAuthenticationToken token) {
        KeycloakPrincipal principal = (KeycloakPrincipal) token.getPrincipal();
        return new Account(
                principal.getName(),
                principal.getKeycloakSecurityContext().getIdToken().getEmail(),
                null,
                token.getAccount().getRoles());

    }
}
