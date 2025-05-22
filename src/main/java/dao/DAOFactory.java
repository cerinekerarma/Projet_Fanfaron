package dao;

public class DAOFactory{
    protected static final DbConnectionManager dbManager = DbConnectionManager.getInstance();


    public static FanfaronDAO getFanfaronDAO(){
        return new FanfaronJDBCDAO(dbManager);
    }
    public static GroupeDAO getGroupeDAO(){
        return new GroupeJDBCDAO(dbManager);
    }
    public static InscriptionGroupeDAO getInscriptionGroupeDAO(){
        return new InscriptionGroupeJDBCDAO(dbManager);
    }

    //TODO Mettre les DAO la dedans

}
