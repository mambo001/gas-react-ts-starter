const onOpen = () => {
  const menu = SpreadsheetApp.getUi()
    .createMenu("My Sample React Project") // menu name
    // .addItem("Sheet Editor", "openDialog") // for dialogs
    .addItem("Sample Sidebar", "openSampleSideBar"); // for sidebars

  menu.addToUi();
};

const openSampleSideBar = () => {
  const template = HtmlService.createTemplateFromFile("client/index");
  const html = template.evaluate().setTitle("Sample Sidebar");
  SpreadsheetApp.getUi().showSidebar(html);
};
