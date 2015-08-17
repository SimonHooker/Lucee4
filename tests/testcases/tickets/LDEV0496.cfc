
component extends="org.lucee.cfml.test.LuceeTestCase"	{

	function beforeAll(){

		test_query = QueryNew( 'a' );
	    QueryAddRow( test_query );
	    QuerySetCell( test_query , 'a' , 'b' );

	}

	function run(){

		describe( 'LDEV-496 long integer values are not mangled' , function() {

			it( 'returns the value that is passed in as numeric in a query'  , function() {

			    result = QueryExecute(
			    	options = {
			    		dbtype = 'query'
			    	},
			    	params = [
			    		{ type = 'numeric' , value = 20150817112756892 }
			    	],
			    	sql = "
			    		SELECT
       						CAST( ? AS CHAR ) AS num
					    FROM test_query
			    	"
			    );

			    expect( ToString( result.num[1] ) ).toBe( '20150817112756892' );

			});

			it( 'returns the value that is hard coded in a query'  , function() {

			    result = QueryExecute(
			    	options = {
			    		dbtype = 'query'
			    	},
			    	sql = "
			    		SELECT
					        20150817112756892 AS inline
					    FROM test_query
			    	"
			    );

			    expect( ToString( result.inline[1] ) ).toBe( '20150817112756892' );

			});

			it( 'returns the value passed in'  , function() {

			    expect( 20150817112756892 ).toBe( '20150817112756892' );

			});

		});

	}

}