public with sharing class APX_SelectedProducts {
    
    @AuraEnabled(cacheable=true)
    public static List<Product2> getProducts(String searchKey, String sortBy,String sortDirection) {
       
        String query = 'SELECT Id, Name,ProductCode,Description FROM Product2';//recordType.Name
        system.debug('query:'+query);
        if ( searchKey != null && searchKey != '' ) {
            String key = '%'+searchKey+'%';
            query += ' WHERE Name LIKE :key AND IsActive = True AND recordType.Name != Paquetes';
        }
        if ( sortBy != null && sortDirection != null ) {
            query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
        }
        query = query + ' LIMIT 20';
        return Database.query( query );
    }

}