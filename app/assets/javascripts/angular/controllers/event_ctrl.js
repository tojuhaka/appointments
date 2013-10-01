App.controller('ModalDemoCtrl', function ($scope, $modal, $log) {

  $scope.items = ['item1', 'item2', 'item3'];

  $scope.open = function () {

    var modalInstance = $modal.open({
      templateUrl: 'myModalContent.html',
      controller: ModalInstanceCtrl,
      resolve: {
        items: function () {
          return $scope.items;
        }
      }
    });

    modalInstance.result.then(function (selectedItem) {
      $scope.selected = selectedItem;
    }, function () {
      $log.info('Modal dismissed at: ' + new Date());
    });
  };
});

App.controller('FormCtrl', function ($scope, $modal, $log) {
  
  $scope.userType = 'guest';
});

var ModalInstanceCtrl = function ($scope, $modalInstance, items) {
  $scope.data = {};
  $scope.items = items;
  $scope.selected = {
    item: $scope.items[0]
  };

  $scope.ok = function (appointment) {
    
    $scope.data = angular.copy(appointment);
    data = {"appointment": $scope.data}
    
    $.ajax({
        method: 'POST',
        url: '/api/appointments.json',
        data: JSON.stringify(data),
        dataType: "JSON"
    }).success(function(data, status, headers, config) {
      alert("SUCCESS");
    }).
    error(function(data, status, headers, config) {
      alert("error");
    });

    $modalInstance.close($scope.selected.item);
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
};
