/**
 * Create / Open a new daily note in Obsidian
 * 
 * Uses the better touch tool application. This script is copied into BTT
 * 
 * https://docs.folivora.ai/docs/1106_java_script.html
 * https://help.obsidian.md/Advanced+topics/Using+Obsidian+URI
 */

(async () => {
  /**
   * Create file if it does not exist and open it in Obsidian
   */
  const date = new Date();
  const isoDate = date.toISOString().slice(0,10);

  let getHomeWrapper = {
      script: `echo "$HOME"`, // mandatory
      launchPath: '/bin/bash', //optional - default is /bin/bash
      parameters: '-c', // optional - default is -c. If you use multiple parameters please separate them by ;; e.g. -c;;date
      environmentVariables: '' //optional e.g. VAR1=/test/;VAR2=/test2/;
  };
  
  const home = await runShellScript(getHomeWrapper);
  const vaultPath = home + "/vaults/personal/ml-zettel/";
  const dailyPath = "Reviews/Daily/";
  const dailyYearFolder = `${date.getFullYear()}-Daily/`;
  const dailyNoteTitle = `${isoDate}.md`;
  
  const fullPath = vaultPath + dailyPath + dailyYearFolder + dailyNoteTitle
  // Got rid of encode as it wasn't opening obsidian at the file + I'm not using
  // special characters anyway
  // const openURI = `obsidian://${encodeURIComponent(fullPath)}`
  const openURI = `obsidian://${fullPath}`
  console.log(dailyNoteTitle);

  const createAndOpenScript = `
    cd "${vaultPath + dailyPath}";
    mkdir -p "${dailyYearFolder}";
    cd "${dailyYearFolder}";
    touch "${dailyNoteTitle}";
    open "${openURI}";
  `;

  let createAndOpenWrapper = {
    script: createAndOpenScript, // mandatory
    launchPath: '/bin/bash', //optional - default is /bin/bash
    parameters: '-c', // optional - default is -c. If you use multiple parameters please separate them by ;; e.g. -c;;date
    environmentVariables: '' //optional e.g. VAR1=/test/;VAR2=/test2/;
  };

  let createResult = await runShellScript(createAndOpenWrapper);

  /**
   * If the file is empty, populate it from a template
   */

  const isEmptyWrapper = {
    // "1" if the file is empty or "0" if it's not
    script: `[[ -s ${fullPath} ]] && echo 0 || echo 1`, // mandatory
    launchPath: '/bin/bash', //optional - default is /bin/bash
    parameters: '-c', // optional - default is -c. If you use multiple parameters please separate them by ;; e.g. -c;;date
    environmentVariables: '' //optional e.g. VAR1=/test/;VAR2=/test2/;
};

  const isEmpty = await runShellScript(isEmptyWrapper);

  // File is not empty, so we don't need to populate it (or risk overwriting)
  if (isEmpty == "0") {
    returnToBTT(isEmpty);
    return;
  }

  const templateDirectory = "Zettelkasten/Templates/";
  const dailyTemplateFile = "Daily-Template.md";

  const insertTemplateScript = `
    cat "${vaultPath + templateDirectory + dailyTemplateFile}" >> "${fullPath}" ;
  `;

  let insertTemplateWrapper = {
    script: insertTemplateScript, // mandatory
    launchPath: '/bin/bash', //optional - default is /bin/bash
    parameters: '-c', // optional - default is -c. If you use multiple parameters please separate them by ;; e.g. -c;;date
    environmentVariables: '' //optional e.g. VAR1=/test/;VAR2=/test2/;
  };

  let insertResult = await runShellScript(insertTemplateWrapper);

  /**
   * Replace template strings
   */

  const replaceScript = `
    sed -i '' -e "s/{{date}}/${isoDate}/g" "${fullPath}";
  `;

  let replaceWrapper = {  
    script: replaceScript, // mandatory
    launchPath: '/bin/bash', //optional - default is /bin/bash
    parameters: '-c', // optional - default is -c. If you use multiple parameters please separate them by ;; e.g. -c;;date
    environmentVariables: '' //optional e.g. VAR1=/test/;VAR2=/test2/;
  };

  let replaceResult = await runShellScript(replaceWrapper);

  returnToBTT(isEmpty);
})();



