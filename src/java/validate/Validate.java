/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validate;

/**
 *
 * @author tranq
 */
public class Validate {

	private Validate () {}

    public static boolean checkPhone(String phone) {
	if (phone.length() > 10 || phone.length() < 10) {
	    return false;
	}
	for (int i = 0; i < phone.length(); i++) {
	    if (phone.charAt(i) < '0' || phone.charAt(i) > '9') {
		return false;
	    }
	}
	return true;
    }
}
