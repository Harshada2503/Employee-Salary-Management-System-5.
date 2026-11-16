
package org.techhub.model;

public class Admin {

    private int admin_id;
    private String username;
    private String password;
    private String full_name;
    private String admin_status;

    public Admin() {
    }

    public Admin(int admin_id, String username, String password,
            String full_name, String admin_status) {

        this.admin_id = admin_id;
        this.username = username;
        this.password = password;
        this.full_name = full_name;
        this.admin_status = admin_status;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getAdmin_status() {
        return admin_status;
    }

    public void setAdmin_status(String admin_status) {
        this.admin_status = admin_status;
    }
}
