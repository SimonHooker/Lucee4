
component extends="org.lucee.cfml.test.LuceeTestCase"	{

	function run(){

		describe( 'java.nio.file.attribute.BasicFileAttributes' , function() {

			beforeEach( function() {

				o = CreateObject(
					'java',
					'java.nio.file.attribute.BasicFileAttributes'
				);

			});

			it( 'is a java.lang.Class that implements the interface specified' , function() {

				expect( o ).toBeInstanceOf( 
					'java.nio.file.attribute.BasicFileAttributes'
				);

				c = o.getClass();

				expect( c ).toBeInstanceOf( 
					'java.lang.Class'
				);

				expect( 
					o.getName() 
				).toBe( 
					'java.nio.file.attribute.BasicFileAttributes' 
				);

			});


		});

	}

}