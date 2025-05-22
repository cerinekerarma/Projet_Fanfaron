package dao;

import java.sql.*;
import java.util.List;

public class InscriptionGroupeJDBCDAO implements InscriptionGroupeDAO {

    private final DbConnectionManager dbManager;

    public InscriptionGroupeJDBCDAO(DbConnectionManager dbManager) {
        this.dbManager = dbManager;
    }

    @Override
    public boolean insert(InscriptionGroupe inscriptionGroupe) {
        try (Connection conn = dbManager.getConnection()) {
            String query = "INSERT INTO inscription_groupe (id_fanfaron, id_groupe) VALUES (?, ?) RETURNING id_fanfaron";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, inscriptionGroupe.getIdFanfaron());
                stmt.setInt(2, inscriptionGroupe.getIdGroupe());

                ResultSet rs = stmt.executeQuery();
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(InscriptionGroupe inscriptionGroupe) {
        return false;
    }

    @Override
    public boolean delete(long id) {
        return false;
    }

    @Override
    public InscriptionGroupe find(String id) {
        return null;
    }

    @Override
    public List<InscriptionGroupe> findAll() {
        return List.of();
    }
}
