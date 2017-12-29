<%--
  Created by IntelliJ IDEA.
  User: hewro
  Date: 2017/12/27
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col w-md bg-white-only b-l bg-auto no-border-xs">
    <div class="wrapper-md padder-md">
        <!-- streamline -->
        <div class="m-b text-md">最近活动</div>
        <div class="streamline b-l m-b">
            <div class="sl-item">
                <div class="m-l">
                    <div class="text-muted">5 minutes ago</div>
                    <p><a href="" class="text-info">Jessi</a> commented your post.</p>
                </div>
            </div>
            <div class="sl-item">
                <div class="m-l">
                    <div class="text-muted">11:30</div>
                    <p>Join comference</p>
                </div>
            </div>
            <div class="sl-item b-success b-l">
                <div class="m-l">
                    <div class="text-muted">10:30</div>
                    <p>Call to customer <a href="" class="text-info">Jacob</a> and discuss the detail.</p>
                </div>
            </div>
            <div class="bg-info wrapper-sm m-l-n m-r-n m-b r r-2x">
                Create tasks for the team
            </div>
            <div class="sl-item b-primary b-l">
                <div class="m-l">
                    <div class="text-muted">Wed, 25 Mar</div>
                    <p>Finished task <a href="" class="text-info">Testing</a>.</p>
                </div>
            </div>
            <div class="sl-item b-warning b-l">
                <div class="m-l">
                    <div class="text-muted">Thu, 10 Mar</div>
                    <p>Trip to the moon</p>
                </div>
            </div>
            <div class="sl-item b-info b-l">
                <div class="m-l">
                    <div class="text-muted">Sat, 5 Mar</div>
                    <p>Prepare for presentation</p>
                </div>
            </div>
            <div class="sl-item b-l">
                <div class="m-l">
                    <div class="text-muted">Sun, 11 Feb</div>
                    <p><a href="" class="text-info">Jessi</a> assign you a task <a href="" class="text-info">Mockup Design</a>.</p>
                </div>
            </div>
            <div class="sl-item b-l">
                <div class="m-l">
                    <div class="text-muted">Thu, 17 Jan</div>
                    <p>Follow up to close deal</p>
                </div>
            </div>
        </div>
        <!-- / streamline -->
    </div>


    <div>
        <!-- aside right -->
        <div class="app-aside-right pos-fix no-padder w-md w-auto-xs bg-white b-l animated fadeInRight hide">
            <div class="vbox">
                <div class="wrapper b-b b-t b-light m-b">
                    <a href="" class="pull-right text-muted text-md" ui-toggle-class="show" target=".app-aside-right"><i class="icon-close"></i></a>
                    Chat
                </div>
                <div class="row-row">
                    <div class="cell">
                        <div class="cell-inner padder">
                            <!-- chat list -->
                            <div class="m-b">
                                <a href="" class="pull-left thumb-xs avatar"><img src="img/a2.jpg" alt="..."></a>
                                <div class="clear">
                                    <div class="pos-rlt wrapper-sm b b-light r m-l-sm">
                                        <span class="arrow left pull-up"></span>
                                        <p class="m-b-none">Hi John, What's up...</p>
                                    </div>
                                    <small class="text-muted m-l-sm"><i class="fa fa-ok text-success"></i> 2 minutes ago</small>
                                </div>
                            </div>
                            <div class="m-b">
                                <a href="" class="pull-right thumb-xs avatar"><img src="img/a3.jpg" class="img-circle" alt="..."></a>
                                <div class="clear">
                                    <div class="pos-rlt wrapper-sm bg-light r m-r-sm">
                                        <span class="arrow right pull-up arrow-light"></span>
                                        <p class="m-b-none">Lorem ipsum dolor :)</p>
                                    </div>
                                    <small class="text-muted">1 minutes ago</small>
                                </div>
                            </div>
                            <div class="m-b">
                                <a href="" class="pull-left thumb-xs avatar"><img src="img/a2.jpg" alt="..."></a>
                                <div class="clear">
                                    <div class="pos-rlt wrapper-sm b b-light r m-l-sm">
                                        <span class="arrow left pull-up"></span>
                                        <p class="m-b-none">Great!</p>
                                    </div>
                                    <small class="text-muted m-l-sm"><i class="fa fa-ok text-success"></i>Just Now</small>
                                </div>
                            </div>
                            <!-- / chat list -->
                        </div>
                    </div>
                </div>
                <div class="wrapper m-t b-t b-light">
                    <form class="m-b-none">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Say something">
                            <span class="input-group-btn">
              <button class="btn btn-default" type="button">SEND</button>
            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- / aside right -->

    </div>
</div>