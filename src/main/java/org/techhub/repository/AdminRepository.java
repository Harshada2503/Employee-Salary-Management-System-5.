
package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import org.techhub.model.Admin;

@Repository
public class AdminRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // BCrypt password encoder
    private BCryptPasswordEncoder passwordEncoder =
            new BCryptPasswordEncoder();

    // RowMapper
    private RowMapper<Admin> rowMapper = (rs, rowNum) -> {

        Admin admin = new Admin();

        admin.setAdmin_id(rs.getInt("admin_id"));
        admin.setUsername(rs.getString("username"));
        admin.setPassword(rs.getString("password"));
        admin.setFull_name(rs.getString("full_name"));
        admin.setAdmin_status(rs.getString("admin_status"));

        return admin;
    };

    // Save Admin with encrypted password
    public int addAdmin(Admin admin) {

        String encodedPassword =
                passwordEncoder.encode(admin.getPassword());

        String sql = "INSERT INTO admins "
                + "(username, password, full_name, admin_status) "
                + "VALUES (?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                admin.getUsername(),
                encodedPassword,
                admin.getFull_name(),
                admin.getAdmin_status()
        );
    }

    // Get Admin by Username
    public Admin getAdminByUsername(String username) {

        String sql = "SELECT * FROM admins WHERE username = ?";

        List<Admin> admins =
                jdbcTemplate.query(sql, rowMapper, username);

        if (admins.isEmpty()) {
            return null;
        }

        return admins.get(0);
    }

    // Validate Admin Login
    public Admin validateAdminLogin(
            String username, String password) {

        Admin admin = getAdminByUsername(username);

        if (admin != null
                && "Active".equalsIgnoreCase(admin.getAdmin_status())
                && passwordEncoder.matches(
                        password, admin.getPassword())) {

            return admin;
        }

        return null;
    }
 // Check whether an admin account already exists
    public int getAdminCount() {

        String sql = "SELECT COUNT(*) FROM admins";

        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
}
