
package org.techhub.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class Department {

    private int department_id;

    @NotBlank(message = "Department name is required")
    @Size(min = 2, max = 50,
          message = "Department name must contain 2 to 50 characters")
    private String department_name;

    @Size(max = 255,
          message = "Description cannot exceed 255 characters")
    private String description;

    @NotBlank(message = "Department status is required")
    private String department_status;

    // Default Constructor
    public Department() {

    }

    // Parameterized Constructor
    public Department(int department_id, String department_name,
            String description, String department_status) {

        this.department_id = department_id;
        this.department_name = department_name;
        this.description = description;
        this.department_status = department_status;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDepartment_status() {
        return department_status;
    }

    public void setDepartment_status(String department_status) {
        this.department_status = department_status;
    }

}
