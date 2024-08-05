export const onOpen = () => {
  const menu = SpreadsheetApp.getUi()
    .createMenu("My Sample React Project") // menu name
    // .addItem("Sheet Editor", "openDialog") // for dialogs
    .addItem("Sample Sidebar", "openSampleSideBar"); // for sidebars

  menu.addToUi();
};

export const openSampleSideBar = () => {
  const html = HtmlService.createHtmlOutputFromFile("index");
  SpreadsheetApp.getUi().showSidebar(html);
};
