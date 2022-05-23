class Decument {
  String doc_title;
  String doc_url;
  String doc_date;
  int num_page;

  Decument(this.doc_title, this.doc_url, this.doc_date, this.num_page);


  //I gathered some pdf decument fron the internet or API

  static List<Decument> doc_list = [
    Decument("Artifcial Intelligence and its Role in Near Future",
        "https://arxiv.org/pdf/1804.01396.pdf", "8-08-2015", 11),
  ];
}