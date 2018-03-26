---
author: "Andrew Goss"
title: "Projects"
---

{{ $paginator := .Paginate (where .Data.Pages "Type" "projects") }}

    {{ range $index, $page := .Paginator.Pages }}
        {{ .Render "li" }}
    {{ end }}

{{ partial "pagination.html" $paginator }}     
   
<hr>