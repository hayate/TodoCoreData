//
//  Tasks.swift
//  TodoCoreData
//
//  Created by Andrea Belvedere on 2021/03/02.
//

import UIKit
import CoreData



class Tasks {
    private static let Instance: Tasks = Tasks()

    private var tasks: [Task]!

    init() {
        tasks = []
    }

    public static func getInstance() -> Tasks {
        return Instance
    }

    public func getTasks() -> [Task] {
        return tasks
    }

    public func count() -> Int {
        tasks.count
    }

    public func getTask(_ index: Int) -> Task {
        return self.tasks[index]
    }

    public func remoteTask(_ index: Int) -> Void {
        if let ctx = self.getCoreDataContext() {
            let task = self.tasks.remove(at: index)
            ctx.delete(task)
        }
    }

    public func addTask(_ task: String) -> Void {
        if let ctx = self.getCoreDataContext() {
            let entity = Task(context: ctx)
            entity.task = task
            entity.done = false
            self.tasks.append(entity)
        }
    }

    public func load() -> Void {
        if let ctx = self.getCoreDataContext() {
            if let entities = try? ctx.fetch(Task.fetchRequest()) {
                if let tasks = entities as? [Task] {
                    self.tasks = tasks
                }
            }
        }
    }

    public func save() -> Void {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

    private func getCoreDataContext() -> NSManagedObjectContext? {
        if let ctx = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            return ctx
        }
        return nil
    }
}

