namespace :doc do
  namespace :diagram do
    task :models do
      sh "railroad -i -a -p -M -o doc/models.dot"
      sh "dot -Tpng doc/models.dot > doc/models.png"
      
    end

    task :controllers do
      sh "railroad -i -l -C | neato -Tsvg | sed 's/font-size:14.00/font-size:11.00/g' > doc/controllers.svg"
    end
  end

  #task :diagrams => %w(diagram:models diagram:controllers)
  task :diagrams => %w(diagram:models)
end
