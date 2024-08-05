export function includes(filename: string) {
  return HtmlService.createTemplateFromFile(filename).evaluate().getContent();
}
