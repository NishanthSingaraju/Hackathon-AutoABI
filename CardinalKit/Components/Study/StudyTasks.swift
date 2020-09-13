//
//  StudyTasks.swift
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import ResearchKit

/**
 This file contains some sample `ResearchKit` tasks
 that you can modify and use throughout your project!
*/
struct StudyTasks {
    
    /**
     Active tasks created with short-hand constructors from `ORKOrderedTask`
    */
    static let tappingTask: ORKOrderedTask = {
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        
        return ORKOrderedTask.twoFingerTappingIntervalTask(withIdentifier: "TappingTask", intendedUseDescription: intendedUseDescription, duration: 10, handOptions: .both, options: ORKPredefinedTaskOption())
    }()
    
    static let walkingTask: ORKOrderedTask = {
        let intendedUseDescription = "Tests ability to walk"
        
        return ORKOrderedTask.shortWalk(withIdentifier: "ShortWalkTask", intendedUseDescription: intendedUseDescription, numberOfStepsPerLeg: 20, restDuration: 30, options: ORKPredefinedTaskOption())
    }()
    
    static let audioTask: ORKOrderedTask = {
        
        return ORKOrderedTask.audioTask(withIdentifier: "Audio_Abi" , intendedUseDescription: "Record the ABI sound" , speechInstruction: "Please record ABI sound", shortSpeechInstruction: "Do it" , duration: 6, recordingSettings: nil, checkAudioLevel: true, options: [])
        
    }()

    
    /**
        Coffee Task Example for 9/2 Workshop
     */
    static let coffeeTask: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        // Instruction step
        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
        instructionStep.title = "Patient Questionnaire"
        instructionStep.text = "This information will help your doctors keep track of how you feel and how well you are able to do your usual activities. If you are unsure about how to answer a question, please give the best answer you can and make a written comment beside your answer."
        
        steps += [instructionStep]
        
        // Coffee Step
        let healthScaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "A Lot 😬", minimumValueDescription: "None 😴")
        
        
        let healthScaleQuestionStep = ORKQuestionStep(identifier: "HealthScaleQuestionStep", title: "Coffee Intake", question: "How many cups of coffee did you have today?", answer: healthScaleAnswerFormat)
        
        steps += [healthScaleQuestionStep]
        
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you for tracking your coffee."
        summaryStep.text = "We appreciate your time."
        
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: "SurveyTask-Coffee", steps: steps)
        
    }()
    
    /**
     Sample task created step-by-step!
    */
    static let sf12Task: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        // Instruction step
        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
        instructionStep.title = "Patient Questionnaire"
        instructionStep.text = "This information will help your doctors keep track of how you feel and how well you are able to do your usual activities. If you are unsure about how to answer a question, please give the best answer you can and make a written comment beside your answer."
        
        steps += [instructionStep]
        
        //In general, would you say your health is:
        let healthScaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
        let healthScaleQuestionStep = ORKQuestionStep(identifier: "HealthScaleQuestionStep", title: "Question #1", question: "In general, would you say your health is:", answer: healthScaleAnswerFormat)
        
        steps += [healthScaleQuestionStep]
        
        let textChoices = [
            ORKTextChoice(text: "Yes, Limited A lot", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Yes, Limited A Little", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "No, Not Limited At All", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let textChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
        let textStep = ORKQuestionStep(identifier: "TextStep", title: "Daily Activities", question: "MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answer: textChoiceAnswerFormat)
        
        steps += [textStep]
        
        
        let imageStep = ORKImageCaptureStep(identifier: "ImageStep")
    
        steps += [imageStep]
        
        
        let formItem = ORKFormItem(identifier: "FormItem1", text: "MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answerFormat: textChoiceAnswerFormat)
        let formItem2 = ORKFormItem(identifier: "FormItem2", text: "Climbing SEVERAL flights of stairs:", answerFormat: textChoiceAnswerFormat)
        let formStep = ORKFormStep(identifier: "FormStep", title: "Daily Activities", text: "The following two questions are about activities you might do during a typical day. Does YOUR HEALTH NOW LIMIT YOU in these activities? If so, how much?")
        formStep.formItems = [formItem, formItem2]
        
        steps += [formStep]
        
        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
        let booleanQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nil, question: "In the past four weeks, did you feel limited in the kind of work that you can accomplish?", answer: booleanAnswer)
        
        steps += [booleanQuestionStep]
        
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you."
        summaryStep.text = "We appreciate your time."
        
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: "SurveyTask-SF12", steps: steps)
    }()
    
    
    static let measure: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        // Instruction step
        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
        instructionStep.title = "Left Leg Measurments"
        instructionStep.text = "This information will be used to help predict ABI levels"
        
        steps += [instructionStep]
        
        
//        let audio_step = ORKAudioStep(identifier: "Speech")
        
        let audio_step = audioTask.steps
//
        steps += audio_step
        
    
        let imageStep = ORKImageCaptureStep(identifier: "ImageStep")

        steps += [imageStep]
        
        let ABI = ORKAnswerFormat.decimalAnswerFormat(withUnit: "abi")
        
        let ABIStep = ORKQuestionStep(identifier: "Number Step", title: nil, question: "What is your ABI?", answer: ABI)
        
        steps += [ABIStep]
        
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you for your particpation."
        summaryStep.text = "We appreciate your time."
        
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: "SurveyTask-Measure", steps: steps)
        
    }()
    
    static let HistoryTask: ORKOrderedTask = {
        
        
        var steps = [ORKStep]()
        
        
        let age = ORKAnswerFormat.decimalAnswerFormat(withUnit: "years")
        
        let ageStep = ORKQuestionStep(identifier: "Age", title: nil, question: "What is your age?", answer: age)
        
        steps += [ageStep]
    
        
        
        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "Male", noString: "Female")
        let booleanQuestionStep = ORKQuestionStep(identifier: "Gender", title: nil, question: "Gender?", answer: booleanAnswer)
        
        steps += [booleanQuestionStep]
        
        
        let booleanAnswer2 = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
        let booleanQuestionStep2 = ORKQuestionStep(identifier: "Diabetes", title: nil, question: "Diabetes?", answer: booleanAnswer2)
        
        steps += [booleanQuestionStep2]
        
        
        
        let booleanAnswer3 = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
        let booleanQuestionStep3 = ORKQuestionStep(identifier: "None-Compressible", title: nil, question: "Non-Compressible", answer: booleanAnswer3)
        
        steps += [booleanQuestionStep3]
        

        
        return ORKOrderedTask(identifier: "history_steps", steps: steps)
    }()
    
    
    
    static let LDP_audio: ORKOrderedTask = {
        
        return ORKOrderedTask.audioTask(withIdentifier: "LDP_Audio" , intendedUseDescription: "The doppler sound data is strong diagnostic tool for artery disease" , speechInstruction: nil, shortSpeechInstruction: "Recording LDP audio...." , duration: 6, recordingSettings: nil, checkAudioLevel: true, options: [])
        
    }()
    
    
    static let ldp: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        
//        let audio_step = ORKAudioStep(identifier: "Speech")
        
        let audio_step = LDP_audio.steps
//
        steps += audio_step
        
    
        let imageStep = ORKImageCaptureStep(identifier: "LDP_Image")

        steps += [imageStep]
        
        let ABI = ORKAnswerFormat.decimalAnswerFormat(withUnit: "abi")
        
        let ABIStep = ORKQuestionStep(identifier: "LDP_ ABI", title: nil, question: "What is your ABI?", answer: ABI)
        
        steps += [ABIStep]
        
        
        return ORKOrderedTask(identifier: "LDP", steps: steps)
        
    }()
    
    
    
    static let LPT_audio: ORKOrderedTask = {
        
        return ORKOrderedTask.audioTask(withIdentifier: "LPT_Audio" , intendedUseDescription: "The doppler sound data is strong diagnostic tool for artery disease" , speechInstruction: nil, shortSpeechInstruction: "Recording LPT audio...." , duration: 6, recordingSettings: nil, checkAudioLevel: true, options: [])
        
    }()
    
    
    static let lpt: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        
//        let audio_step = ORKAudioStep(identifier: "Speech")
        
        let audio_step = LPT_audio.steps
//
        steps += audio_step
        
    
        let imageStep = ORKImageCaptureStep(identifier: "LPT_Image")

        steps += [imageStep]
        
        let ABI = ORKAnswerFormat.decimalAnswerFormat(withUnit: "abi")
        
        let ABIStep = ORKQuestionStep(identifier: "LPT_ ABI", title: nil, question: "What is your ABI?", answer: ABI)
        
        steps += [ABIStep]
        
        
        return ORKOrderedTask(identifier: "LPT", steps: steps)
        
    }()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    static let FinalTask: ORKOrderedTask = {
        
        
        var steps = [ORKStep]()
        
        
        // Instruction step
        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
        instructionStep.title = "Patient Questionnaire"
        instructionStep.text = "This information will help your doctors diagnose using ABI."
        
        steps += [instructionStep]
        
        let l_ans = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
        
        let l = ORKQuestionStep(identifier: "Left", title: nil, question: "Would you like to input data for you left leg?", answer: l_ans)
        
        steps += [l]
    
        let dorsalis_pedis = ORKInstructionStep(identifier: "DP")
        dorsalis_pedis.title = "DP right leg"
        dorsalis_pedis.text = "Please be ready to analyze the doppler sound, image of the waveform, and ankle brachial index for the doralist pedis on your left leg"
        
        
        steps += [dorsalis_pedis]
        
        steps += ldp.steps
        
        
        let posterior_tibial = ORKInstructionStep(identifier: "PT")
        posterior_tibial.title = "PT Left Leg"
        posterior_tibial.text = "Please be ready to analyze the doppler sound, image of the waveform, and ankle brachial index for the posterior tibial on your left leg"
        
        steps += [posterior_tibial]
        
        
        let r_ans = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
        
        let r = ORKQuestionStep(identifier: "Right", title: nil, question: "Would you like to input data for you Right leg?", answer: r_ans)
        
        
        steps += [r]
        
        
        let dorsalis_pedis_r = ORKInstructionStep(identifier: "DP2")
        dorsalis_pedis_r.title = "DP Left Leg"
        dorsalis_pedis_r.text = "Please be ready to analyze the doppler sound, image of the waveform, and ankle brachial index for the doralist pedis on your right leg"
        
        steps += [dorsalis_pedis_r]
        
        
        
        let posterior_tibial_r = ORKInstructionStep(identifier: "PT2")
        posterior_tibial_r.title = "PT Right Leg"
        posterior_tibial_r.text = "Please be ready to analyze the doppler sound, image of the waveform, and ankle brachial index for the posterior tibial on your right leg"
        
        steps += [posterior_tibial_r]
        
        
        
        let h_ans = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
        
        let h = ORKQuestionStep(identifier: "History", title: nil, question: "Would you like to input data on your history?", answer: r_ans)
        
        steps += [h]
        
        
        let ready = ORKInstructionStep(identifier: "H")
        ready.title = "History"
        ready.text = "Please be ready to answer questions about your age and other health conditions"
        
        steps += [ready]
        
        steps += HistoryTask.steps
        
    
        //SUMMARY
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you."
        summaryStep.text = "We appreciate your time."
        
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: "Final", steps: steps)
    }()
    
    
    

    
    
    

    
}



