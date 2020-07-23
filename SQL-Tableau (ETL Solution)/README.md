## Summary
### Objective
This ETL solution aims to provide a manufacturing company, ABC Company Pte Ltd, a data warehouse for its simplified supply chain, production and sales process and department users.


### Context
Manufacturing company, ABC Company Pte Ltd, has the current business processes in place as shown below.

![Workflow](https://user-images.githubusercontent.com/55055667/88260646-5bf51c00-ccf7-11ea-8fa3-31af2ef62fe6.png)


### Flow of Project
- Understand the OLTP and OLAP business requirements
- Design relevant ER diagrams to meet these business needs
- As a simulation, generate synthetic data through python in consideration of business requirements and conformity to database schema and integrity constraints
  - Codes are in ETL Solution - ABC Company.docx, Appendix
- Build BI dashboards to meet OLAP business requirements, visualized by connecting Tableau to the MySQL data warehouse


## Key Sections
### Business Requirements
Below are the business requirements from an OLTP and OLAP standpoint.
![Requirements](https://user-images.githubusercontent.com/55055667/88262070-171eb480-ccfa-11ea-85fa-c3eeb5cfd151.png)

### OLTP
Below is the OTLP design for the simulated data generated
![OLTP](https://user-images.githubusercontent.com/55055667/88261473-f570fd80-ccf8-11ea-9c3c-ae15e09dcc08.png)

### ETL to OLAP
Summarized transformation of data
![OLTP to OLAP](https://user-images.githubusercontent.com/55055667/88261873-ae373c80-ccf9-11ea-8ff0-e10941b2be5b.png)

### OLAP
This results in the following ER design
![OLAP](https://user-images.githubusercontent.com/55055667/88261917-c3ac6680-ccf9-11ea-93fd-806c1de61c60.png)

### BI outputs + Key takeaways
![BI1](https://user-images.githubusercontent.com/55055667/88262162-3fa6ae80-ccfa-11ea-9380-6fbdd74f4028.png)


![BI2](https://user-images.githubusercontent.com/55055667/88262178-46cdbc80-ccfa-11ea-9c30-1106a6a4eca6.png)
