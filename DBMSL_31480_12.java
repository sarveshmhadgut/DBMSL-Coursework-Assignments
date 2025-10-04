import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.FindIterable;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import org.bson.Document;
import java.util.Iterator;

class Assignment12{
	public static void main(String[] args) {
		try {
			//MongoClient
			MongoClient mongo = new MongoClient("localhost", 27017);

			//MongoDatabase
			MongoDatabase db = mongo.getDatabase("mock_con");

			//Create collection
			db.createCollection("Student")
			MongoCollection<Document> collection = db.collection("Student");

			//Create document
			MongoCollection <Document> doc = new Document("name", "Simon Riley");
			doc.append("roll_no", 10);
			doc.append("email", "simriley44@yahoo.com");

			//Insert doc
			collection.insertOne(doc);

			//update doc
			collection.updateOne(Filters.eq("name", "Simon Riley"), Updates.set("roll_no", 20));

			//delete doc
			collection.deleteOne(Filters.eq("name", "Simon Riley"));

			FindIterable <Document> itrDoc = db.collection("Student");
			Iterator <Document> it = itrDoc.iterator();
			while (it.hasNext()) {
				System.out.println(it.next());
			}

			//Create connection
			MongoClient mongo = new MongoClient("localhost",27017);
			MongoDatabase db = mongo.getDatabase("pract");

			//Create collection
			db.createCollection("orders");
			MongoCollection<Document> collection = db.getCollection("orders");
			Document doc = new Document("product","book");
			doc.append("price", 220);
			doc.append("customer", "Ayush");

			//Create
			collection.insertOne(doc);

            //Read
			FindIterable<Document> iterDoc = collection.find();
			Iterator<Document> it = iterDoc.iterator();
			while(it.hasNext()) {
				System.out.println(it.next());
			}

            //Update
			collection.updateOne(Filters.eq("product","book"), Updates.set("price",240));
			//Delete
			collection.deleteOne(Filters.eq("product","book"));
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}