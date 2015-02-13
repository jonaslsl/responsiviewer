rv = angular.module("responsiviewer")
rv.directive 'elementDraggable', ->
  restrict: 'AE'
  link: (scope, element, attrs) ->
    interact '.draggable'
      .draggable
        inertia: false
        restrict:
          restriction: "parent",
          endOnly: true,
          elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
        onmove: (event) ->
          target = event.target
          x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx
          y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy
          //$('.is-selected').removeClass 'is-selected'
          //target.classList.add "is-selected"
          target.style.webkitTransform =
          target.style.transform = 'translate(' + x + 'px, ' + y + 'px)'
          target.setAttribute 'data-x', x
          target.setAttribute 'data-y', y
          return
        onend: (event) ->
      return
rv.directive 'elementResizable', ->
  restrict: 'AE'
  link: (scope, element, attrs) ->
    interact '.resize'
      .resizable(true)
      .on 'resizemove' , (event) ->
        target = event.target
        // $('.is-selected').removeClass 'is-selected'
        // target.classList.add "is-selected"
        newWidth  = parseFloat(target.style.width ) + event.dx
        newHeight = parseFloat(target.style.height) + event.dy
        target.style.width  = newWidth + 'px'
        target.style.height = newHeight + 'px'
        return
    return