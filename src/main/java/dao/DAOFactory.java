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
    public static PupitreDAO getPupitreDAO(){
        return new PupitreJDBCDAO(dbManager);
    }
    public static InscriptionPupitreDAO getInscriptionPupitreDAO(){
        return new InscriptionPupitreJDBCDAO(dbManager);
    }
    public static EvenementDAO getEvenementDAO(){
        return new EvenementJDBCDAO(dbManager);
    }
    public static InscriptionEvenementDAO getInscriptionEvenementDAO(){
        return new InscriptionEvenementJDBCDAO(dbManager);
    }

}
