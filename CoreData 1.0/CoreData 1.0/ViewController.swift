import UIKit
import CoreData
class ViewController: UIViewController {
    var apDel = UIApplication.shared.delegate as! AppDelegate
    var mangObjContx:NSManagedObjectContext?
    var studEntity:NSEntityDescription?
    var teacherEntity:NSEntityDescription?
    var str = ""
    @IBOutlet weak var printTV: UITextView!
    @IBOutlet weak var TF1: UITextField!
    @IBOutlet weak var TF2: UITextField!
    @IBOutlet weak var TF3: UITextField!
    @IBOutlet weak var TF4: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mangObjContx = self.apDel.persistentContainer.viewContext
        self.studEntity = NSEntityDescription.entity(forEntityName: "Student", in: self.mangObjContx!)
    }
    @IBAction func studentTap(_ sender: UIButton)
    {
        let savestudentMangObj = NSManagedObject(entity: self.studEntity!, insertInto: self.mangObjContx)
        savestudentMangObj .setValue(TF1.text!, forKey: "name")
        savestudentMangObj .setValue(TF2.text!, forKey: "school")
        savestudentMangObj .setValue(TF3.text!, forKey: "standard")
        savestudentMangObj .setValue(103, forKey: "rollno")
        do {
            try self.mangObjContx?.save()
            print("done")
        } catch  {
            print(error)
        }
    }
    @IBAction func techerTap(_ sender: UIButton)
    {
    }
    @IBAction func retrive(_ sender: UIButton)
    {
        let fetchFromStudent = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        do {
            let arrStud = try self.mangObjContx?.fetch(fetchFromStudent)
            for i in arrStud as! [NSManagedObject]{
                let strname:String = (i.value(forKey: "name")) as! String
                let strschool:String = (i.value(forKey: "school")) as! String
                let strClass:String = (i.value(forKey: "standard")) as! String
                self.str.append(strname + "\n" + strschool + "\n" + strClass)
                printTV.text = self.str
            }
        } catch  {
            print("what went down !")
        }
    }
}

