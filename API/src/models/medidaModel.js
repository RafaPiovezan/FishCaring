var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {
    instrucaoSql = `select 
                        temperatura, 
                        temperatura, 
                        dataHora,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                    from monitoramento
                    where fksensor = ${idAquario}
                    order by idmonitoramento desc limit ${limite_linhas}`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {
    instrucaoSql = `select 
                        temperatura, 
                        temperatura, DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
                        fksensor 
                        from monitoramento where fksensor = ${idAquario} 
                    order by idmonitoramento desc limit 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}