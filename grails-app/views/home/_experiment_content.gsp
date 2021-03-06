<section class="content-header" id="expTemplate">
    <div class="row">
        <div class="col-md-1"></div>

        <div class="col-md-10">
            <g:render template="/home/alert-templates"/>
            <h1 id="experiment-name">${experiment.name}</h1>
            <g:hiddenField name="experiment" value="${experiment.id}"/>
        </div>

        <div class="col-md-1"></div>
    </div>
</section>

<section class="content-header">
    <div class="row">
        <div class="col-md-1"></div>

        <div class="col-md-10">
            <div class="box box-success box-solid">
                <div class="box-header with-border">
                    <div class="col-md-2">
                        <h3 class="box-title" id="roundNumber">Round ${roundNbr + 1} of ${experiment.roundCount}</h3>
                    </div>

                    <div class="col-md-9">
                        <g:hiddenField name="experimentDuration" value="${experiment.roundTime}"/>
                    </div>

                    <div class="col-md-1">
                        <span id="timerPanel"></span>
                    </div>
                </div>

                <div class="box-body">
                    <div class="row">
                        <div class="col-md-1"></div>

                        <div class="col-md-2">
                            <ul class="nav nav-tabs tabs-left">
                                <g:each in="${userList}" var="user" status="i">
                                    <g:if test="${user.key != 0}">
                                        <li class="${user.key != 1 ?: 'active'}">
                                            <a href='#neighbour${user.key}' data-toggle='tab'>neighbour${user.key}</a>
                                        </li>
                                    </g:if>
                                %{--<loom:currentUserTab userKey="${user.key}"/>--}%
                                </g:each>
                            </ul>
                        </div>

                        <div class="col-xs-9">
                            <div class="tab-content" id="dvSourceContainer">
                                <g:each in="${userList}" var="user" status="i">
                                    <g:if test="${user.key != 0}">
                                        <div class="tab-pane ${user.key != 1 ?: "active"}" id="neighbour${user.key}">
                                            <ul class="dvSource">
                                                <g:each in="${user.value.tts}" var="tt">
                                                    <li class="ui-state-default" drag-id="${tt.id}">${tt.text}</li>
                                                </g:each>
                                            </ul>
                                        </div>
                                    </g:if>
                                %{--<loom:currentUserTabContent userKey="${user.key}" userValue="${user.value}"/>--}%
                                </g:each>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <div class="row"></div>

                    <div class="row">
                        <div class="col-md-1"></div>

                        <div class="col-md-10 table-bordered ui-widget-content" id="dvDest">
                            <ul style="min-height: 200px !important;" id="sort2" class="g_list">
                                <g:each in="${userList}" var="user">
                                    <g:if test="${user.key == 0}">
                                        <g:each in="${user.value.tts}" var="tt">
                                            <li class="ui-state-default purple" drag-id="${tt.id}">${tt.text}</li>
                                        </g:each>
                                    </g:if>
                                </g:each>

                                <g:if test="${tempStory?.size() > 0}">
                                    <g:each in="${tempStory}" var="tail">
                                        <li class="ui-state-default purple" drag-id="${tail.id}">${tail.text}</li>
                                    </g:each>
                                </g:if>
                            %{--<g:else>--}%
                            %{--<li class="placeholder">Add tails here</li>--}%
                            %{--</g:else>--}%
                            </ul>
                        </div>

                        <div class="col-md-1"></div>
                    </div>

                    <hr/>

                    <div class="row">
                        <div class="col-lg-9"></div>

                        <div class="col-lg-3" id="btn-panel">
                            %{--<button type="submit" class="btn btn-success"--}%
                                    %{--id="submit-experiment">Submit</button>--}%
                            %{--<button type="reset" id="reset-experiment" class="btn btn-default">Reset</button>--}%
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-1"></div>
    </div>
</section>