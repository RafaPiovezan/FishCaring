var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas}
        temperatura, 
        temperatura as umidade,  
                        dataHora,
                        CONVERT(varchar, dataHora, 108) as momento_grafico
                    from monitoramento
                    where fksensor = 1
                    order by idmonitoramento desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        temperatura, 
        temperatura,
                        dataHora,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                    from monitoramento
                    where fksensor = 1
                    order by idmonitoramento desc limit ${limite_linhas}`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1
                        temperatura, 
                        temperatura as umidade,  
                        CONVERT(varchar, dataHora, 108) as momento_grafico, 
                        fksensor 
                        from monitoramento where fksensor = 1 
                    order by idmonitoramento desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
                        temperatura, 
                        temperatura,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
                        fksensor 
                        from monitoramento where fksensor = 1 
                    order by idmonitoramento desc limit 1`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
