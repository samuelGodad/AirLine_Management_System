<%--
  Created by IntelliJ IDEA.
  User: Sami
  Date: 1/2/2024
  Time: 11:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Delete Record</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this record?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <form action="delete_coupon" method="post">
                    <input type="hidden" name="coupon_name" id="deleteCouponName">
                    <input type="hidden" name="discountpercentage" id="deleteDiscountpercentage">
                    <button type="submit" class="btn btn-primary" style="color: red">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>