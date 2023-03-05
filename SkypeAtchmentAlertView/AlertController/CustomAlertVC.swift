//
//  CustomAlertVC.swift
//  SkypeAtchmentAlertView
//
//  Created by Farooq Hassan on 3/5/23.
//

import Foundation
import UIKit


class CustomAlertVC: UIAlertController , UITableViewDataSource,UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    var controller: UITableViewController

    private var myactionArray = [CustomAlertAction]()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        controller = UITableViewController(style: .plain)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        //controller.tableView.register(CustomAlertViewcell.self, forCellReuseIdentifier: "CustomAlertViewcell")
        controller.tableView.register(UINib(nibName: "CustomAlertViewcell", bundle: nil), forCellReuseIdentifier: "CustomAlertViewcell")
        controller.tableView.dataSource = self
        controller.tableView.delegate = self
        controller.tableView.addObserver(self, forKeyPath: "contentSize", options: [.initial, .new], context: nil)
        self.setValue(controller, forKey: "contentViewController")
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
       
        controller.tableView.bounces = false
        controller.tableView.rowHeight = UITableView.automaticDimension
        controller.tableView.estimatedRowHeight = 65
        
        controller.tableView.sectionHeaderHeight = UITableView.automaticDimension;
        controller.tableView.estimatedSectionHeaderHeight = 40;
        controller.tableView.separatorStyle = .none
        controller.tableView.register(UINib(nibName: "CutomAlertViewHeaderCell", bundle: nil), forCellReuseIdentifier: "CutomAlertViewHeaderCell")
    }
    
    func addAction(name:CustomAlertAction){
        self.myactionArray.append(name)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == "contentSize" else {
            return
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            controller.preferredContentSize = CGSize(width: 300, height: controller.tableView.contentSize.height)
        }
        else {
            controller.preferredContentSize = controller.tableView.contentSize
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        controller.tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = Bundle.main.loadNibNamed("CutomAlertViewHeaderCell", owner: self, options: nil)?.first as! CutomAlertViewHeaderCell
            headerView.croxxButtonAction = { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myactionArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomAlertViewcell", for: indexPath) as! CustomAlertViewcell
        
        let a = myactionArray[indexPath.row]
        cell.myPhotoImageView.layer.cornerRadius = 10
        cell.myPhotoImageView.contentMode = .scaleAspectFit
        cell.titel.text = a.name
        cell.descriptionLbl.text = a.decs
        cell.myPhotoImageView.image = a.Image
        tableView.separatorStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.dismiss(animated: true, completion: {

            let a = self.myactionArray[indexPath.row]
            a.clickHandler?()
        })
    }

    
    
}


class CustomAlertAction {
    let name : String?
    let Image : UIImage?
    let decs : String?
    let clickHandler : (()->())?
    
    init(name:String?,image:UIImage?,decs:String?,clickHandler : (()->())?) {
        self.name = name
        self.Image = image
        self.decs = decs
        self.clickHandler = clickHandler
    }
}

