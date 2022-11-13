//
//  ViewController.swift
//  ProgrammaticUI
//
//  Created by Wojciech Spaleniak on 06/10/2022.
//

/*
 NOTES:
 
 MAMY 2 SPOSOBY NA UTWORZENIE OBIEKTU, NADANIE MU WŁAŚCIWOŚCI I DODANIE DO WIDOKU:
 1) SPOSÓB 1:
    - INICJALIZUJEMY OBIEKT W KLASIE
    - TWORZYMY FUNKCJĘ W KTÓREJ DODAJEMY OBIEKT DO WIDOKU ORAZ NADAJEMY MU WŁAŚCIWOŚCI
    - WYWOWŁUJEMY FUNKCJĘ W viewDidLoad()
 2) SPOSÓB 2:
    - INICJALIZUJEMY OBIEKT W KLASIE I OD RAZU W CLOSURE NADAJEMY MU WŁAŚCIWOŚCI - ABY TO ZROBIĆ, TO W CLOSURE TWORZYMY OBIEKT POMOCNICZY, KTÓRY NA KOŃCU ZWRACAMY SŁOWEM RETURN - PO ZAMKNIĘCIU CLOSURE MUSIMY PAMIĘTAĆ O ()
    - W FUNKCJI viewDidLoad() DODAJEMY UTWORZONY OBIEKT DO WIDOKU
    - MORE CLEANER
 
 LAZY:
    - SŁOWO lazy SPRAWIA, ŻE OBIEKT NIE ZOSTANIE UTWORZONY W PAMIĘCI URZĄDZENIA, DOPÓKI NIE BĘDZIE POTRZEBNY
    - MOŻEMY GO UŻYĆ TYLKO ZE ZMIENNYMI var, NIE MOŻEMY UŻYWAĆ ZE STAŁYMI let
    - NP: lazy var object: UILabel = {...}()
 
 */

import UIKit

class ViewController: UIViewController {
    
    // INICJALIZACJA OBIEKTU welcomeLbl WRAZ Z USTAWIENIEM JEGO WŁAŚCIWOŚCI
    lazy var welcomeLbl: UILabel = {
        // INICJALIZACJA TYMCZASOWEGO OBIEKTU label
        let label = UILabel()
        // USTAWIENIE WŁAŚCIWOŚCI
        label.frame = CGRect(x: 100, y: 300, width: 100, height: 30)
//        label.frame.size = .init(width: 100, height: 30)
//        label.center = view.center
        label.backgroundColor = .systemPink
        label.text = "Welcome"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        // ZWROT TYMCZASOWEGO OBIEKTU label I PRZYPISANIE DO welcomeLbl
        return label
    }()
    
    lazy var nextLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.text = "Next"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    lazy var myLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemMint
        label.text = "My Label"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DODANIE OBIEKTÓW DO WIDOKU
        let uiLabels = [welcomeLbl, nextLbl, myLbl]
        uiLabels.forEach { view.addSubview( $0 ) }
        
        // USTAWIENIE CONSTRAINTS
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        // UTWORZENIE CONSTRAINTS ORAZ ICH AKTYWACJA
        NSLayoutConstraint.activate([
            //
            nextLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextLbl.widthAnchor.constraint(equalToConstant: 100),
            nextLbl.heightAnchor.constraint(equalToConstant: 30),
            //
            myLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLbl.topAnchor.constraint(equalTo: nextLbl.bottomAnchor, constant: 30),
//            myLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            myLbl.widthAnchor.constraint(equalToConstant: 100),
            myLbl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
