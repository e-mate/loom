package edu.msu.mi.loom

import grails.converters.JSON
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.JSONObject

@Transactional
class ParserService {
    def createExperiment(String text) {
        JSONObject json = JSON.parse(text)

        if (json.training.practice != null) {
            createTraining(json.training.practice)
        }

        if (json.training.simulation != null) {
            createSimulation(json.training.simulation)
        }
    }

    def createSimulation(def json) {
        def task
        Simulation simulation
        json.each { sim ->
            println "-----roundTime-------"
            println json.timeperround
            println "-----roundCount-------"
            println json.sequence.size()
            println json.sequence.get(0).size()

            simulation = new Simulation(name: 'Simulation', roundTime: json.timeperround, roundCount: json.sequence.size(), userCount: json.sequence.get(0).size()).save(flush: true)


            for (int i = 0; i < json.sequence.size(); i++) {
                task = new Task(text: json.solution.get(i), text_order: i).save(failOnError: true)

                if (json.sequence.get(i).has("${i}")) {
                    new UserTask(task: task, simulation: simulation, user_nbr: i, round_nbr: i).save(flush: true)
//                    UserTask.createForSimulation(task, simulation, i, i)
                }
            }
//
//            if (simulation.save(flush: true)) {
//                log.info("Created simulation with id ${simulation.id}")
//                return simulation
//            } else {
//                log.error("Simulation creation attempt failed")
//                log.error(simulation?.errors?.dump())
//                return null;
//            }

        }
    }

    def createTraining(def json) {
        def task
        Training training
        json.each { tr ->
            training = new Training(name: 'Training')
            for (int i = 0; i < tr.problem.size(); i++) {
                task = new Task(text: tr.solution.get(i), text_order: tr.problem.get(i), round_nbr: 1).save(failOnError: true)
                training.addToTask(task)
            }

            if (training.save(flush: true)) {
                log.info("Created training with id ${training.id}")
                return training
            } else {
                log.error("Training creation attempt failed")
                log.error(training?.errors?.dump())
                return null;
            }

        }
    }
}