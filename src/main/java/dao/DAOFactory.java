package dao;

public class DAOFactory{
    protected static final DbConnectionManager dbManager = DbConnectionManager.getInstance();


    public static FanfaronDAO getFanfaronDAO(){
        return new FanfaronJDBCDAO(dbManager);
    }

    //TODO Mettre les DAO la dedans

}
