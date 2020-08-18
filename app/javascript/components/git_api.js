const results = document.querySelector("#results");
let commits = 0;
let numberOfRepos = 0;
let repos = [];
let commits_by_date = [];
let repository = "repositories"
let commit = "commits"

const callGitApi = () => {
  if (results) {
    fetch("https://api.github.com/users/prevostjules/events")
    .then(response => response.json())
    .then((data) => {
      data.forEach((result) => {
        repos.push(result["repo"]["id"]);
        if (result["payload"]["commits"] !== undefined) {
          const commitsInEvent = result["payload"]["commits"].length;
          commits += commitsInEvent;
          commits_by_date.push(result["created_at"]);
        }
      });
      let date = new Date(commits_by_date[commits_by_date.length - 1])
      let dateLocale = date.toLocaleDateString();

      repos = [...new Set(repos)];
      if (repos.length == 1) {
        repository = "repository"
      }
      if (commit ==1) {
        commit = "commit"
      }
      const gitApi = `<div class="div-keppel p-3 git-activity"><div class="card card-simple card-result"><h3>Git & GitHub</h3><p>${commits} ${commit} poussés sur ${repos.length} ${repository} depuis le ${dateLocale}.</p></div></div>`;
      results.insertAdjacentHTML("beforeend", gitApi);
    });
  }

};

export {callGitApi};
