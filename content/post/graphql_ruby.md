---
author: "Andrew Goss"
date: 2019-07-09
title: Build GraphQL Server with Ruby
tags:
  - api development
  - graphql
  - ruby
---
![RGraphQL with Ruby](/img/post/graphql_ruby.png "GraphQL with Ruby")<br>
<a href="https://www.howtographql.com/graphql-ruby/0-introduction/" target="_blank">TUTORIAL LINK</a><br>
<hr>

<sub>*Source: <a href="https://www.howtographql.com" target=_>How To GraphQL</a></sub>

Built my own GraphQL server using the following technologies:

* <a href="http://rubyonrails.org" target=_>Ruby on Rails</a>: the most popular library for building applications in <a href="https://www.ruby-lang.org/en" target=_>Ruby</a>
* <a href="http://graphql-ruby.org" target=_>GraphQL Gem</a>: the most popular library for building <a href="http://graphql.org" target=_>GraphQL</a> applications
* <a href="https://github.com/graphql/graphiql" target=_>GraphiQL</a>: An in-browser IDE for exploring <a href="http://graphql.org" target=_>GraphQL</a>, which comes bundled with <a href="http://graphql-ruby.org" target=_>GraphQL Gem</a>

### Resources
* <a href="https://facebook.github.io/graphql" target=_>Official Specification</a>
* <a href="https://www.graph.cool" target=_>Graphcool (Self-Hosted GraphQL BaaS)</a>

<img src="/img/post/graphql_ruby_tutorial_graphiql.png" "GraphiQL" width="98%">

### GraphQL Queries Run
```
# Welcome to GraphiQL
#
# Keyboard shortcuts:
#
#  Prettify Query:  Shift-Ctrl-P (or press the prettify button above)
#  Run Query:  Ctrl-Enter (or press the play button above)
#  Auto Complete:  Ctrl-Space (or just start typing)
#

query getAllLinks {
  allLinks {
    id
    url
    description
		postedBy {
      name
      votes {
        link {
          description
        }
      }
    }
  }
}

query allLinksFilter {
  allLinks(filter: {descriptionContains: "testing"
  OR: {descriptionContains: "best"}
  }) {
    description
  }
}

query LinksPagination {
  allLinks(first: 1, skip: 1) {
    id
  }
}

# https://www.howtographql.com/graphql-ruby/3-mutations
mutation addNewLink {
  createLink(
    url: "http://npmjs.com/package/graphql-tools",
    description: "Best tools!",
  ) {
    id
    url
    description
    postedBy {
      id
      name
    }
  }
}

mutation createUser {
  createUser(
    name: "Andrew Goss",
    authProvider: {
      email: {
        email: "agoss19@example.com",
        password: "dumb_password"
      }
    }
  ) {
    id
    email
    name
  }
}

mutation signInUser {
  signinUser(
    email: {
      email:"agoss19@example.com",
      password: "dumb_password"
    }
  ) {
    token
    user {
      id
    }
  }
}

mutation createLink {
  createLink(
    url: "http://localhost:3000/graphiql",
    description: "Your testing playground",
  ) {
    id
    url
    description
    postedBy {
      id
      name
    }
  }
}

mutation createVote {
  createVote(linkId:"5") {
    link {
      description
    }
    user {
      name
    }
  }
}

mutation createInvalidLink {
  createLink(url:"", description:"") {
    id
  }
}
```

<br class="custom"><a href="https://github.com/andrewrgoss/graphql-tutorial-ruby" class="btn" target="_blank">View my code on GitHub</a><br class="custom">