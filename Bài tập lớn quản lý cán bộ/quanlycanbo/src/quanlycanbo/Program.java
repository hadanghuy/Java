/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package quanlycanbo;

/**
 *
 * @author Huy Laptop
 */
import GeneralManagement.Login;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class Program {
     public static void ShowHidePasswd(javax.swing.JPasswordField password, javax.swing.JCheckBox check){
        if(check.isSelected()){
            password.setEchoChar((char)0);
        } else {
            password.setEchoChar('\u25cf');
            //password.setEchoChar('*');
         }
    }
    public static KeyAdapter Onlynumber = new KeyAdapter() {
    @Override
    public void keyTyped(KeyEvent e) {
        char c = e.getKeyChar();
        if ( ((c < '0') || (c > '9')) && (c != KeyEvent.VK_BACK_SPACE)) {
            e.consume();  // if it's not a number, ignore the event
        }
     }
    };
    public static void main(String[] args) {
        // TODO code application logic here
        Login FormSwing = new Login();
        FormSwing.setVisible(true);
    }
    
}


