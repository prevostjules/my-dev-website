const results = document.querySelector("#results");
var commits = 0;
var numberOfRepos = 0;
var repos = [];
var commits_by_date = [];

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
      repos = [...new Set(repos)];
      const gitApi = `"${commits}-${repos.length}-${commits_by_date[commits_by_date.length - 1]}"`;
      results.insertAdjacentHTML("beforeend", gitApi);
    });
  }

};

export {callGitApi};
