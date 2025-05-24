package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PupitreJDBCDAO implements PupitreDAO {

    private final DbConnectionManager dbManager;

    public PupitreJDBCDAO(DbConnectionManager dbManager) {
        this.dbManager = dbManager;
    }

    @Override
    public Pupitre find(int id) {
        String sql = "SELECT id, nom FROM Pupitre WHERE id = ?";
        try (Connection connection = dbManager.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Pupitre(
                            rs.getInt("id"),
                            rs.getString("nom")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Remplace par un logger si nécessaire
        }
        return null;
    }

    @Override
    public List<Pupitre> findAll() {
        List<Pupitre> pupitres = new ArrayList<>();
        String sql = "SELECT id, nom FROM Pupitre";
        try (Connection connection = dbManager.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    pupitres.add(new Pupitre(
                            rs.getInt("id"),
                            rs.getString("nom")
                    ));
                }
                return pupitres;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Remplace par un logger si nécessaire
        }
        return pupitres;
    }
}
