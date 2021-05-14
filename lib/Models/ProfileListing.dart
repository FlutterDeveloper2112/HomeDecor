class ProfileListing{
  String categoryName;
  List<SubCategoryName> subCategoryName;

  ProfileListing(String categoryName,List<SubCategoryName> subCategoryName){
    this.categoryName=categoryName;
    if(subCategoryName!=null){
      this.subCategoryName = new List<SubCategoryName>();
      subCategoryName.forEach((element) {
        this.subCategoryName.add(SubCategoryName(element.toString()));
      });
    }

  }

}
class SubCategoryName{
  String subCategory;
  SubCategoryName(String subCategory){
    this.subCategory=subCategory;
  }
}
