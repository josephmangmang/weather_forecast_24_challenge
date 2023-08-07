
# Weather forecast 24h challenge
Minimal architecture for small-mid scale applications.

#### 🏛️ Architecture
MVVM architecture

![layer](images/image01.png)

The overall architecture is composed of two layers; UI Layer and the data layer. Each layer has dedicated components and they each have different responsibilities. The arrow means the flow of the communication & component has a dependency on the target component following its direction.
This means that the User interface can only communicate to the ViewModel and doesn't have direct access to the data layer.


#### Setup
1. Clone repository
2. run `make pub_get` or you can run manually the script in `makefile`
3. run `make force_build`
4. start the app by running `make run`

#### Workflow
Use `git flow` to manage branches.

To start new feature:
`git flow feature start [feature_name] ` ex: `git flow feature start authentication`

Once done implementing feature:
`git flow feature finish [feature_name] ` ex: `git flow feature finish authentication`

Preparing for release:
`git flow release start [version]` ex: `git flow release start 0.1.0`

To finish a release branch, use the following methods:
`git flow release finish [version]'` ex: `git flow release finish '0.1.0'`

For more info about git flow, [read here](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow#:~:text=What%20is%20Gitflow%3F,lived%20branches%20and%20larger%20commits. "read here")


