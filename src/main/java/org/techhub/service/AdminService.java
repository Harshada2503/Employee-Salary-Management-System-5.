
package org.techhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Admin;
import org.techhub.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    // Register Admin
    public int addAdmin(Admin admin) {
        return adminRepository.addAdmin(admin);
    }

    // Get Admin by Username
    public Admin getAdminByUsername(String username) {
        return adminRepository.getAdminByUsername(username);
    }

    // Validate Admin Login
    public Admin validateAdminLogin(
            String username, String password) {

        return adminRepository.validateAdminLogin(
                username, password);
    }
 // Check whether an admin account already exists
    public int getAdminCount() {
        return adminRepository.getAdminCount();
    }
}
