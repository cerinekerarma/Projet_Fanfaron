package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GroupeJDBCDAO implements GroupeDAO {

    private final DbConnectionManager dbManager;

    public GroupeJDBCDAO(DbConnectionManager dbManager) {
        this.dbManager = dbManager;
    }


    @Override
    public Groupe find(int id) {
        String sql = "SELECT id, nom FROM Groupe WHERE id = ?";
        try (Connection connection = dbManager.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return new Groupe(
                            rs.getInt("id"),
                            rs.getString("nom")
                        );
                    }
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Groupe> findAll() {
        List<Groupe> groupes = new ArrayList<Groupe>();
        String sql = "SELECT id, nom FROM Groupe";
        try (Connection connection = dbManager.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    groupes.add(new Groupe(
                            rs.getInt("id"),
                            rs.getString("nom"))
                    );
                }
                return groupes;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return groupes;
    }
}
