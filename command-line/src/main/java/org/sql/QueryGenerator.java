package org.sql;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;

import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class QueryGenerator {
    public static void main(String[] args) {
        try {
            // read file
            Path readFilePath = Paths.get("reports", "users.json");
            String json = Files.readString(readFilePath);

            // parse json string into list of user objects
            ObjectMapper objectMapper = new ObjectMapper();
            List<User> users = objectMapper.readValue(json, new TypeReference<List<User>>() {
            });

            // generate sql query
            StringBuilder query = new StringBuilder();
            for (User user : users) {
                query.append("INSERT INTO users VALUES(");
                query.append(user.getId() + ",");
                query.append("\'" + user.getUsername() + "\',");
                query.append("\'" + user.getFirst_name() + "\',");
                query.append("\'" + user.getLast_name() + "\',");
                query.append("\'" + user.getEmail() + "\',");
                query.append("\'" + user.getAvatar() + "\',");
                query.append("\'" + user.getPassword() + "\');\n");
            }

            // write file
            Path writeFilePath = Paths.get("db", "seeds", "users.sql");
            Files.writeString(writeFilePath, query.toString());

            System.out.println("SQL query successfully generated.");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}