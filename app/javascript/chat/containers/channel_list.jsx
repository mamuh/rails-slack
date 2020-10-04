import React, { Component } from 'react';
import { bindActionCreators, compose } from 'redux';
import { connect } from 'react-redux';
import { selectChannel, fetchMessages } from '../actions/index';
import { withRouter } from "react-router-dom";

class ChannelList extends Component {
  componentWillReceiveProps(nextProps) {
    if (nextProps.selectedChannel !== this.props.selectedChannel) {
      this.props.fetchMessages(nextProps.selectedChannel);
    }
  }

  handleClick = (channel) => {
    this.props.selectChannel(); // will empty message list first
    this.props.fetchMessages(channel);
    this.props.history.push(`/channels/${channel}`);
  }

  renderChannel = (channel) => {
    return (
      <li
        key={channel.id}
        className={channel === this.props.selectedChannel ? 'active' : null}
        onClick={() => this.handleClick(channel)}
        role="presentation"
      >
        #{channel.name}
      </li>
    );
  }

  render() {
    return (
      <div className="channels-container">
        <span>Redux Chat</span>
        <ul>
          {this.props.channels.map(this.renderChannel)}
        </ul>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    channels: state.channels
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ selectChannel, fetchMessages }, dispatch);
}

export default compose(
  withRouter,
  connect(mapStateToProps, mapDispatchToProps)
)(ChannelList);
