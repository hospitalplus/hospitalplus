# TRABALHO 01:  Hospital+ 
Trabalho desenvolvido durante a disciplina de Banco de Dados do Integrado
Hospital+: hospitalplus2018@gmail.com<br>
# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
João Antônio Sobrinho Covre: joaoantonioscovre@gmail.com<br>
Matheus Kuster Rosa: matheuskuster@hotmail.com<br>
Sibely Smiderle Alves: sibelyalves7@gmail.com<br>

### 2.INTRODUÇÃO E MOTIVAÇAO<br>
Este documento contém a especificação do projeto do banco de dados <nome do projeto> 
<br>e motivação da escolha realizada. <br>

> Hoje, no Brasil, temos grande dificuldade de ir ao hospital, tanto
no pronto socorro, quanto para marcarmos consultas. Ficamos horas nas
filas dos prontos-socorros ou precisamos ligar para milhares de hospitais
procurando um horário de consulta que encaixe na nossa agenda. Muitas
vezes isso chega a ser frustrante.<br>
A solução que pensamos para esse problema foi um sistema
onde o usuário pode selecionar a área que precisa ser atendido, em caso
de marcar consultas, já será mostrado todos os horários disponíveis do
hospital e o usuário pode marcar sua consulta por ali mesmo.

 

### 3.MINI-MUNDO Novo<br>

Quando aberto, o aplicativo será iniciado na aba de Login, onde o usuário poderá logar com seu nome de usuário e senha, ou clicar no botão para cadastro. Caso faça, será redirecionado para outra página para inserir suas informações. Dos Pacientes serão armazenados Nome, Sobrenome, Data de Nascimento, Sexo, Email, Senha, CPF, Convênios e Telefone. Dos Médicos serão armazenados Nome, Sobrenome, Data de Nascimento, Sexo, Email, Senha, CPF, Convênios, Horários e local de atendimento, Registro Profissional e Telefone.
Pacientes serão atendidos por médicos. Pacientes poderão marcar consultas com Médicos. Pacientes poderão adicionar Médicos a seus favoritos.<br/>
<b>(1)</b> O usuário, já logado, será redirecionado para a página inicial, onde serão exibidos perfis de médicos e hospitais com as melhores recomendações, logo abaixo daqueles que pagaram para promover seus perfis. O usuário tem acesso a um menu na parte de baixo, onde pode acessar as páginas:
<ol>
	<li>Página Inicial</li>
	<li>Consultas</li>
	<li>Tratamentos</li>
	<li>Perfil</li>
</ol>
	<b>(2)</b> Na página de consultas existe 4 opções:
<ol>
	<li>Suas consultas</li>
	<li>Favoritos</li>
	<li>Marcar</li>
</ol>
<b>(2.1)</b> Na página de Suas consultas, será exibido as consultas futuras, já marcadas pelo usuário.<br/>
<b>(2.2)</b> Na página Favoritos, será exibido os perfis de médicos e hospitais marcados como favoritos pelo usuário.<br/>
<b>(2.3)</b> Na página Marcar, o usuário poderá escolher uma especialidade, e o raio de atendimento, assim, aparecerá os médicos e hospitais da área que atendem a especialidade, o usuário poderá escolher um e marcar uma consulta.<br/>
<b>(3)</b> Na página de Tratamentos, os médicos, após a realização das consultas, poderão enviar ao paciente, pelo aplicativo, a medicação a ser tomada, e por quanto tempo.<br/>
<b>(4)</b> No perfil, o médico, ou paciente poderá ver suas informações, editá-las, mexer nas configurações do aplicativo, além da aba "Fale Conosco" para se comunicar com os administradores do aplicativo.<br/>

### 4.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
O foco deste aplicativo e a portabilidade e uma interface intuitiva para atingir todos os públicos, para melhor representação utilizamso o proto.io para representar em forma de aplicativo a interface de uso de aplicativo<br>

Feito no Proto.io: https://proto.io/<br>

![Alt text](https://github.com/hospitalplus/hospitalplus/blob/master/imagens/letreiro.png "logo")
![Arquivo PDF do Protótipo Proto.io feito para Hospital+](https://github.com/hospitalplus/hospitalplus/blob/master/arquivos/protoio-Hospital+.pdf "Hospital+")


#### 4.1 TABELA DE DADOS DO SISTEMA:
   ![Tabela de dados do sistema](https://github.com/hospitalplus/hospitalplus/blob/master/arquivos/dados.xlsx)
    
    
#### 4.2 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?

1) Especialidade de um médico<br/>
    2) Horario de atendimento de um medico<br/>
    3) Local de atendimento<br/>
    4) Avaliação dos medicos<br/>
    5) Remedios<br/>
    6) Plano de saude mais popular<br/>
    7) Alergias mais comuns<br/>
    8) Especialidades<br/>
    9) Hospitais da região<br/>
    10) Médicos da região<br/>
    
    
### 5.MODELO CONCEITUAL<br>

![Alt text](https://github.com/hospitalplus/hospitalplus/blob/master/imagens/brmodelohospitalplus.PNG)

#### 5.1 DESCRIÇÃO DOS DADOS 
    PACIENTES: tabela que armazena as informações relativas ao paciente
    id_Usuario: campo que armazena o numero de identificação do paciente
    Nome: campo que armazena o nome do paciente
    Sobrenome: campo que armazena o sobrenome do paciente
    DataNascimento: campo que armazena a data de nascimento do paciente
    Sexo: campo que armazena o sexo do paciente
    Email: campo que armazena o email do paciente
    CPF: campo que armazena o número de Cadastro de Pessoa Física para cada paciente
    Telefone: campo que armazena o telefone do paciente
    DataInclusao: campo que armazena a data de inclusao do paciente
    id_Convenios: campo que armazena o id do Convenio proveniente da tabela de convenios
    id_Alergia: campo que armazena o id da Alergia proveniente da tabela de Alergia
    id_GrupoSAnguineo: campo que armazena o id do Grupo Sanguioneo da tabela  Grupo Sanguineo
    
    ESPECIALISTAS: tabela que armazena as informações relativas ao especialista
    id_Especialista: campo que armazena o numero de identificação do especialista
	Nome: campo que armazena o nome do especialista
	Sobrenome: campo que armazena o sobrenome do especialista
	DataNascimento: campo que armazena a data de nascimento do especialista
	Sexo: campo que armazena o sexo do especialista
	Email: campo que armazena o email do especialista
	CPF: campo que armazena o número de Cadastro de Pessoa Física para cada especialista
	Telefone: campo que armazena o telefone do especialista
	DataInclusao: campo que armazena a data de inclusao do especialista
	id_Convenios: campo que armazena o id do Convenio proveniente da tabela de convenios    	
   	Registro: campo que armazena o registro do especialista Ex.: CRM, CRO
    
    ALERGIAS: tabela que armazena uma lista de alergias
    tipoAlergia: alergias
    GRUPO SANGUINEO: tabela que armazena os tipos saguineos
    ORIENTACOES: tabela que contem as orientacoes do tratamento inseridas pelo médico
    
    TRATAMENTOS: tabela que contem os dados do tratamento de um medico para um paciente
    idTratamento: identifica o tratamento
    Remedio: campo que armazena o remdio a ser tomado
    Dosagem: campo que contem a dosagem do remedio
    Frequencia: campo que contem a frequencia do tratamento em horas
    Periodo: campo que contem a duracao em dias do tratamento
    horaInicio: campo que contem a hora de inicio do tratamento para a contagem do perido
    
    CONSULTAS: tabela que contem os dados da consulta
    idConsulta: campo que contem a identificacao da consulta
    horaConsulta: campo que contem a hora da consulta
    idLocal: campo que contem o local da consulta
    diaConsulta: campo que contem a data da consulta
    idMedico: Campo que contem o id do medico que irá realizar a consulta
    idPaciente: Campo que contem o id do paciente que da consulta
    idTratamento:campo que contem o id do tratamento passado com a consulta
    
    CONVENIOS: tabela que contem os convenios
    convenios: convenios médicos
    
    ESPECIALIDADE: tabela que armazena as especilidades atendidas
    especialidade: 
    
    AVALIACAOMEDICO: tabela as avaliacoes
    avaliacao: campo que varia de 1 a 5 armazenado no medico
    
    AGENDA: tabela que armazena a agenda do medico
    idHorario: campo que armazena o id do horario
    idEspecialista: campo que armazena o id do especialista que pertence aquela agenda
    
    HORARIO: tabela que armazena os horarios de cada agenda
    idHorario: campo que contém identificador do hoario
    HorIni: campo que contém a hora de inicio de atendimento
    HorFim: campo que armazena a hora de término do atendimento
    Dia: armazena o dia da agenda vigente
    
    LOCALATENDIMENTO: tabela que armazena o local do atendimento
    locAtend: campo que armazena o id do local de atendimento
    
    LOCAL: tabela que armazena os local
    locais: campo que armazena os locais disponiveis

### 6	MODELO LÓGICO<br>
![Clique e acesse o modelo logico](https://github.com/hospitalplus/hospitalplus/blob/master/arquivos/hospitalplusmodelologico.mwb)

### 7	MODELO FÍSICO<br>
![Clique e acesse o modelo físico](https://github.com/hospitalplus/hospitalplus/blob/master/arquivos/sqlhospitalplus.sql)    
        
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
#### 8.1 DETALHAMENTO DAS INFORMAÇÕES
        a) inclusão das instruções de inserção dos dados nas tabelas criadas pelo script de modelo físic
        b) formato .SQL

#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELA E INSERÇÃO DOS DADOS
        a) Junção dos scripts anteriores em um único script 
        (create para tabelas e estruturas de dados + dados a serem inseridos)
        b) Criar um novo banco de dados para testar a restauracao 
        (em caso de falha na restauração o grupo não pontuará neste quesito)
        c) formato .SQL
#### 8.3 INCLUSÃO DO SCRIPT PARA EXCLUSÃO DE TABELAS EXISTENTES, CRIAÇÃO DE TABELA NOVAS E INSERÇÃO DOS DADOS
        a) Junção dos scripts anteriores em um único script 
        (Drop table + Create de tabelas e estruturas de dados + dados a serem inseridos)
        b) Criar um novo banco de dados para testar a restauracao 
        (em caso de falha na restauração o grupo não pontuará neste quesito)
        c) formato .SQL


### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>
#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
    a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not
    b) Criar no mínimo 3 consultas com operadores aritméticos 
    c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas
#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>
    a) Criar outras 5 consultas que envolvam like ou ilike
    b) Criar uma consulta para cada tipo de função data apresentada.


    
#### 9.5	ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>


#### 9.6	CONSULTAS COM JUNÇÃO E ORDENAÇÃO (Mínimo 6)<br>
        a) Uma junção que envolva todas as tabelas possuindo no mínimo 3 registros no resultado
        b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho
        

## Marco de Entrega 02 em: (16/06/2018)<br>
### ATUALIZAÇÃO DA DOCUMENTAÇÃO DOS SLIDES PARA APRESENTAÇAO SEMESTRAL (Mínimo 6 e Máximo 10)<br>
<br>
    Data de Entrega: (30/06/2018)
<br>

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>

#### 9.8	CONSULTAS COM LEFT E RIGHT JOIN (Mínimo 4)<br>
#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho
#### 9.10	SUBCONSULTAS (Mínimo 3)<br>

#### 9.11	LISTA DE CODIGOS DAS FUNÇÕES E TRIGGERS<br>
        Detalhamento sobre funcionalidade de cada código.
        a) Objetivo
        b) Código do objeto (função/trigger)
        c) exemplo de dados para aplicação
        d) resultados em forma de tabela/imagem
<br>


#### 9.12	GERACAO DE DADOS (MÍNIMO DE 100 MIL REGISTROS PARA PRINCIPAL RELAÇAO)<br>
        a) principal tabela do sistema deve ter no mínimo 100 mil registros
        b) tabelas diretamente relacionadas a tabela principal 10 mil registros
        c) tabelas auxiliares de relacao multivalorada mínimo de 10 registros
        d) registrar o tempo de inserção em cada uma das tabelas do banco de dados
        e) especificar a quantidade de registros inseridos em cada tabela
        Para melhor compreensão verifiquem o exemplo na base de testes:<br>
        https://github.com/discipbd2/base-de-testes-locadora
        

#### 9.13	Backup do Banco de Dados<br>
        Detalhamento do backup.
        a) Tempo
        b) Tamanho
        c) Teste de restauração (backup)
        d) Tempo para restauração
        e) Teste de restauração (script sql)
        f) Tempo para restauração (script sql)
<br>

Data de Entrega: (Data a ser definida)
<br>

#### 9.14	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
    a) Lista de índices, tipos de índices com explicação de porque foram implementados nas consultas 
    b) Performance esperada VS Resultados obtidos
    c) Tabela de resultados comparando velocidades antes e depois da aplicação dos índices (constando velocidade esperada com planejamento, sem indice e com índice Vs velocidade de execucao real com índice e sem índice).
    d) Escolher as consultas mais complexas para serem analisadas (consultas com menos de 2 joins não serão aceitas)
    e) As imagens do Explain devem ser inclusas no trabalho, bem como explicações sobre os resultados obtidos.
    f) Inclusão de tabela mostrando as 10 execuções, excluindo-se o maior e menor tempos para cada consulta e 
    obtendo-se a media dos outros valores como resultado médio final.
<br>
    Data de Entrega: (Data a ser definida)
<br>   

### 10	ATUALIZAÇÃO DA DOCUMENTAÇÃO DOS SLIDES PARA APRESENTAÇAO FINAL (Mínimo 6 e Máximo 10)<br>
<br>
    Data de Entrega: (Data a ser definida)
<br>

### 11 Backup completo do banco de dados postgres 
    a) deve ser realizado no formato "backup" 
        (Em Dump Options #1 Habilitar opções Don't Save Owner e Privilege)
    b) antes de postar o arquivo no git o mesmo deve ser testado/restaurado por outro grupo de alunos/dupla
    c) informar aqui o grupo de alunos/dupla que realizou o teste.

    
### 12	TUTORIAL COMPLETO DE PASSOS PARA RESTAURACAO DO BANCO E EXECUCAO DE PROCEDIMENTOS ENVOLVIDOS NO TRABALHO PARA OBTENÇÃO DOS RESULTADOS<br>
        a) Outros grupos deverão ser capazes de restaurar o banco 
        b) executar todas as consultas presentes no trabalho
        c) executar códigos que tenham sido construídos para o trabalho 
        d) realizar qualquer procedimento executado pelo grupo que desenvolveu o trabalho

### 13	DIFICULDADES ENCONTRADAS PELO GRUPO<br>  

    
>## Marco de Entrega 04/Entrega Final em: (Data definida no cronograma)<br>

       
### 14  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
   
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/

#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")


        
        


    





