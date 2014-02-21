(function() {
  this.eventApp = angular.module('eventApp', []);

  this.eventApp.controller('eventCtrl', function($scope, $http, $sce) {
    return $http.get('http://memphis-ruby-api.herokuapp.com/calendar.json?keyword=Memphis+Ruby').then(function(res) {
      var event;
      event = res.data.meetups[0];
      console.log(event);
      $scope.event = event;
      $scope.date = moment(event.time).format('MMMM Do YYYY, h:mm a');
      return $scope.description = $sce.trustAsHtml(event.description);
    });
  });

}).call(this);