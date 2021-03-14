public class fromJson {
public cls_Company[] companies;
	class cls_Company {
		public String name;	//Google
	}
	public static fromJSON parse(String json){
		return (fromJSON) System.JSON.deserialize(json, fromJSON.class);
	}
}