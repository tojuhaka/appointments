App = angular.module('Calendar', ['ui.calendar', 'ngResource']);

App.controller('CalendarCtrl', function ($scope) {
    /* Change View */
    $scope.changeView = function(view,calendar) {
      calendar.fullCalendar('changeView',view);
    };
    /* config object */
    $scope.uiConfig = {
      calendar:{
        height: 450,
        editable: true,
        header:{
          left: 'title',
          center: '',
          right: 'today prev,next'
        },
        dayClick: $scope.alertEventOnClick,
        eventDrop: $scope.alertOnDrop,
        eventResize: $scope.alertOnResize
      }
    };
    /* event sources array*/
    $scope.eventSource = {
            url: "/api/appointments.json",
            className: 'gcal-event',           // an option!
            currentTimezone: 'America/Chicago' // an option!
    };
    $scope.eventSources = [$scope.eventSource];


});
