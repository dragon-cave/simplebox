## Arquitetura

Esta seção apresenta uma visão geral da arquitetura de software da aplicação "Simple box". Descreve os principais componentes, camadas e interações entre componentes da aplicação, fornecendo uma compreensão geral da estrutura e organização do sistema.

## Componentes

A aplicação segue o modelo de implantação em nuvem, utilizando para isso o framework [Django](https://docs.djangoproject.com/en/5.0/) da linguagem Python combinado a biblioteca Django REST framework para criação de APIs web, além da utilização de serviços da Amazon Web Services ([AWS](https://docs.aws.amazon.com/?nc2=h_ql_doc_do)). Os componentes do sistema estão divididos da seguinte forma:

**Model:** Camada responsável por conter a estrutura lógica e relacionamento entre dados da aplicação, os serviços da AWS utilizados para a persistência desses dados foram Amazon Simple Storage Service ([Amazon S3](https://aws.amazon.com/pt/pm/serv-s3/)) no armazenamento dos arquivos multimídia como imagens,áudios e vídeos e o Amazon Relational Database Service ([Amazon RDS](https://docs.aws.amazon.com/pt_br/AmazonRDS/latest/UserGuide/Welcome.html)) utilizando [PostgresSQL](https://www.postgresql.org/docs/) para dados de usuários e arquivos.

**View:** Esta camada interpreta e atende requisições originadas pelo sistema do cliente( por meio de endpoints), realizando comandos de criação, atualização, leitura e exclusão de dados  utilizando classes definidas  na camada model para retornar as informações a camada de Template.

**Template** :  templates [React](https://react.dev/learn) em JavaScript com definições de layouts e estruturas renderizadas na interface da aplicação para interação com usuário e geração de requisições para atendimento pela camada View.

**Controller:** O framework segue o modelo MVT(Model-View-Template), porém funciona internamente como controller para a aplicação.
    

## Funcionamento da Aplicação

## Visão Completa da arquitetura

[![Arquitetura Simplebox](architecture-img/Full-Architecture.png)](architecture-img/Full-Architecture.png)

**Acesso do usuário**

Cada instância EC2 criada na VPC Amazon([Amazon Virtual Private Cloud](https://aws.amazon.com/pt/vpc/)) executa tanto o lado cliente como lado servidor da aplicação, com as requisições geradas no lado cliente sendo atendidas pelo lado servidor da instância.

**Balanceamento de carga**

Todas o acesso a instâncias da aplicação pelos navegadores dos usuários são distribuídas pelo serviço [AWS Elastic Load Balancing](https://docs.aws.amazon.com/pt_br/elasticloadbalancing/latest/userguide/what-is-load-balancing.html) de forma a garantir o balanço de carga entre as instâncias ativas,contribuindo para um melhor desempenho, escalabilidade e disponibilidade da aplicação.

**AutoScaling**

Através de dados fornecidos pelo serviço de monitoramento [Amazon CloudWatch](https://docs.aws.amazon.com/pt_br/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) é feito o diagnóstico de funcionamento da aplicação, ocorrendo a intervenção do serviço Amazon responsável pelo ajuste na quantidade e recursos para instâncias EC2, o  [Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/pt_br/autoscaling/ec2/userguide what-is-amazon-ec2-auto-scaling.html), que cria nova instância da aplicação na VPC quando o sistema está sobrecarregado( acima de 80% da capacidade de processamento ou RAM do servidor principal) garantindo assim a disponibilidade da solução.

**Persistência de dados**

O gerenciamento e operações CRUD sobre objetos do usuário armazenados de forma persistente nos serviços de armazenamento Amazon S3 e Amazon RDS são delimitados por permissões de leitura e escrita definidas nas configurações presentes no Amazon Identity and Access Management([IAM](https://aws.amazon.com/pt/iam/)) referentes a cada um dos serviços. 