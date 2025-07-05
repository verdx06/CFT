//
//  CFTShiftTests.swift
//  CFTShiftTests
//
//  Created by Виталий Багаутдинов on 05.07.2025.
//

import XCTest
@testable import CFTShift

final class CFTShiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_FaileвValidationDataForRegistration() {
        let vm = RegistrationViewModel(registrationUseCase: RegisterDI.makeUseCase())
        
        let errorMessage = vm.validateAndSaveUser(name: "K", surname: "K", password: "K", confirmPassword: "K")
        
        XCTAssert(errorMessage != nil)
        
    }
    
    func test_SuccessValidationDataForRegistration() {
        let vm = RegistrationViewModel(registrationUseCase: RegisterDI.makeUseCase())
        
        let errorMessage = vm.validateAndSaveUser(name: "Ksenia", surname: "Kovalchyk", password: "Qwerty", confirmPassword: "Qwerty")
        
        XCTAssert(errorMessage == nil)
        
    }
    
    func test_saveUser() {
        let vm = RegistrationViewModel(registrationUseCase: RegisterDI.makeUseCase())
        
        vm.user = nil
        
        XCTAssertTrue(vm.user == nil)
        
        vm.validateAndSaveUser(name: "Ksenia", surname: "Kovalchyk", password: "Qwerty", confirmPassword: "Qwerty")
        
        XCTAssertTrue(vm.user != nil)
        
        vm.user = nil
        
        vm.getUser()
        
        XCTAssertTrue(vm.user != nil)
    }
    
    //MARK: Тест getData рабочий, но из-за того что API работает криво и данные иногда могут не приходить - тест проваливается, если запустить 1-2 раза, то тест будет success, если больше, то данные перестают приходить
    
//    func test_getData() async throws {
//        let vm = HomeViewModel(domain: HomeDI.make())
//
//        XCTAssertTrue(vm.data.count == 0)
//
//        vm.getData()
//
//        try await Task.sleep(nanoseconds: 1000000000)
//
//        XCTAssertTrue(vm.data.count >= 1)
//
//    }
    

}
