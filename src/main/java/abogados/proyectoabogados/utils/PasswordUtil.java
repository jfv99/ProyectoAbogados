package abogados.proyectoabogados.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {

    /**
     * Método para cifrar una contraseña utilizando SHA-256.
     * @param password La contraseña en texto plano ingresada por el usuario.
     * @return La contraseña cifrada en formato hexadecimal (hash).
     * @throws NoSuchAlgorithmException Si el algoritmo SHA-256 no está disponible.
     */
    public static String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256"); // Usamos el algoritmo SHA-256
        byte[] hash = md.digest(password.getBytes()); // Cifrar la contraseña (genera un array de bytes)

        // Convertir el array de bytes a formato hexadecimal
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString(); // Devolver la contraseña cifrada en formato hexadecimal
    }

    /**
     * Método para verificar si la contraseña ingresada coincide con la almacenada en la base de datos.
     * @param originalPassword La contraseña en texto plano ingresada por el usuario.
     * @param storedPasswordHash El hash de la contraseña almacenada en la base de datos.
     * @return True si las contraseñas coinciden, False de lo contrario.
     * @throws NoSuchAlgorithmException Si el algoritmo SHA-256 no está disponible.
     */
    public static boolean verifyPassword(String originalPassword, String storedPasswordHash) throws NoSuchAlgorithmException {
        // Cifrar la contraseña ingresada por el usuario
        String hashedPassword = hashPassword(originalPassword);
        
        // Comparar el hash de la contraseña ingresada con el hash almacenado
        return hashedPassword.equals(storedPasswordHash);
    }
}
