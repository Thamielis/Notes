---
created: 2025-05-28T14:05:07 (UTC +02:00)
tags: []
source: https://medium.com/software-architecture-foundations/documenting-software-architecture-in-code-repository-74716412b0a2
author: Huseyin Kutluca
---

# Documenting Software Architecture in Code Repository | by Huseyin Kutluca | Software Architecture Foundations | Medium

---
[

![Huseyin Kutluca](https://miro.medium.com/v2/resize:fill:64:64/1*izAFa99FRxeCvMffF5uD9g.jpeg)



](https://medium.com/@hkutluca?source=post_page---byline--74716412b0a2---------------------------------------)

![](https://miro.medium.com/v2/resize:fit:700/0*Ji6ODqmUnlx71Gr4)

Markdown is a standard simple syntax for creating professional-looking documents. It is simpler than HTML and can be managed without a special editor for writing. Git configuration management tool also supports markdown format. In the Git environment, markdown is generally used for simple introduction of the project and build instructions. (readme.md). This article describes how to use the markdown format for architectural documentation, along with templates.

## Architectural Documentation with Markdown

Managing the architectural design and design decisions of the software together with the code will provide great convenience for the project. When our design is kept in the configuration management environment together with the code, we can carry out the design change and code change together. When new engineer starts to the project and pulls the code to his computer, he has the opportunity to see the architecture of the system.

## Prepare Markdown Document IDE

You can use Visual Studio Code and similar IDE to prepare markdown documents together with your code.(There are markdown editors in the market, but it will be more practical to do it from with the IDE). You can use the “Markdown Preview Enhanced” plugin in Visual Studio Code. With this plugin, you can visually see the markdown document in VS Code (Preview). You can also produce HTML, World or PDF documents using the same tool.

![](https://miro.medium.com/v2/resize:fit:700/0*Do-gaqy2siaXYVLf.png)

MD Document Preparation with VS Code

## UML and C4 Diagrams

You can put UML and [C4 diagrams](https://medium.com/software-architecture-foundations/software-architecture-modeling-with-c4-model-e9e61d952121) that you have drawn with the Plant UML script language into the Markdown document. This way, you keep the entire design, including the drawing, in one place. UML and C4 diagrams that you put in the Markdown document can be seen as figures in the preview window. (with a plugin called “PlantUML”). In addition, when you export pdf or html, you will be able to see these diagrams as figures. The GIT tool has a feature to visually display the design scripts written in this PlantUML. In this way, it is possible to see the design with Bitbucket (with the appropriate version and configuration). This feature is not yet available on the open source Github site.

![](https://miro.medium.com/v2/resize:fit:630/0*i-5YSvu4z6Uo87-P.png)

Adding a C4 Component Diagram to a Markdown document

If the git server does not support visualization, you can first make a png or svg drawing using Visual Studio Code PlantUML plugin or from the plantuml server site. If you create fıle with puml extension (such as setup\_sequence.puml) and select Export Current Diagram in right mouse click menu then you can export the diagram to image format. Then you can and push the relevant drawing to the Git server and give this drawing as a drawing link in the markdown document. You can use this method in drawings you make with other tools.

## Arc 42 Template

[Arc 42](https://arc42.org/overview/) is a template for architectural documentation. By properly completing this Arc42 template, you will have the key design decisions for your software architecture and the design in one place.  
1 — Introduction and Goals  
2 — Constraints  
3 — Context and scope  
4 — Solution strategy  
5 — Building block view  
6 — Runtime view  
7 — Deployment view  
8 — Cros cutting Concepts  
9 — Architectural decisions  
10 — Quality Attributes  
11 — Risks and technical debt  
12 — Glossary

You can access the template for markdown on the [Arc 42 website.](https://arc42.org/download) There is a draft on the relevant site as a single file or as a separate file for each section.  
You can use both C4 Model and UML diagrams in this template. For example, we can use the C4-Context diagram under Chapter 3, the C4-Container diagram and the C4-Component diagram in Chapter 5. C4-Dynamic diagram or UML sequence diagram can be used in Chapter 6. C4 or UML notation can be used for the deployment diagram in Chapter 7.  
For Chapter 10, we can use the tables prepared for the Architectural Trade-off Analysis Method (ATAM). In this context, you can access and use the [markdown table draft I have prepared.](https://github.com/hkutluca/yazilimmimarileri/blob/master/ATAM%20Template.md)

![](https://miro.medium.com/v2/resize:fit:630/0*pbPKKrnXF7xrkv2B.png)

I do prefer wring my architectural decision in this table format. You may also use [Markdown Architecture Decision Records (MADR)](https://adr.github.io/madr/) and save them in your code repository.

## Conclusion

It is recommended to prepare architecture document in markdown format with Arc [42 template and put it in Git repository. Drawings of architecture (UML and C4) shall be prepared using script based tools (like PlantUML)](https://github.com/hkutluca/yazilimmimarileri/blob/master/arch42_with_c4.md) and managed in Git reposıtory too. This solution offers a high quality, manageable, version controlled and traceable architectural documentation.

## Alternatives:

I have talked about my favorite selections while documentation of the architecture in git repository. There are more free or commercial alternatives that you may also use for this purposes. Following are some of the alternatives that I know of:

**Documentation template:**

-   **Markdown (.md):** [**https://www.markdownguide.org/**](https://www.markdownguide.org/)
-   Restructured Text (.rst): [https://docutils.sourceforge.io/rst.html](https://docutils.sourceforge.io/rst.html)
-   Ascidoc: [https://asciidoc-py.github.io/index.html](https://asciidoc-py.github.io/index.html)

**Script Based Design Tools**

-   **PlantUML (UML, C4, Mindmap etc.) :** [**https://plantuml.com/**](https://plantuml.com/)
-   Mermaid (UML): [https://mermaid-js.github.io/mermaid/#/](https://mermaid-js.github.io/mermaid/#/)
-   Structurizr (C4) : [https://structurizr.com/](https://structurizr.com/)

**Editors:**

-   **VS Code**
-   Intellij

Architecture Templates

-   **arc 42** [**https://arc42.org/**](https://arc42.org/)
-   Markdown ADR : [https://adr.github.io/madr/](https://adr.github.io/madr/)
-   ISO/IEC/IEEE 42010 Architecture description (AD) template:[http://www.iso-architecture.org/42010/templates/](http://www.iso-architecture.org/42010/templates/), [https://github.com/jam01/SDD-Template](https://github.com/jam01/SDD-Template)
-   No template- Just put diagrams into the folder
