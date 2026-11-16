
package org.techhub.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan(basePackages = { "org.techhub.service", "org.techhub.repository" })
public class DBConfig {

	// Configure MySQL DataSource
	@Bean
	public DataSource dataSource() {

		DriverManagerDataSource dataSource = new DriverManagerDataSource();

		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");

		dataSource.setUrl("jdbc:mysql://localhost:3306/employeesalarymanagement");

		dataSource.setUsername("root");

		// Replace with your MySQL password
		dataSource.setPassword("root");

		return dataSource;
	}

	// Configure JdbcTemplate
	@Bean
	public JdbcTemplate jdbcTemplate(DataSource dataSource) {

		return new JdbcTemplate(dataSource);
	}
}
